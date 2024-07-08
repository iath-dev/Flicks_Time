import 'dart:developer';

import 'package:flicks_time/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flicks_time/src/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_list_state.dart';
part 'movies_list_events.dart';

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  final ApiService service;
  final String _endpoint;

  MoviesListBloc(this._endpoint, this.service)
      : super(const MoviesListInitial()) {
    on<LoadListEvent>((event, emit) async {
      emit(const MoviesListLoading());

      try {
        final data = await service.getMovies(_endpoint);
        emit(MoviesListLoaded(data.results));
      } catch (e) {
        log(e.toString());
        emit(const MoviesListError());
      }
    });
  }
}
