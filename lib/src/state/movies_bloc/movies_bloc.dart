import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flicks_time/src/models/models.dart';
import 'package:flicks_time/src/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final ApiService apiService;
  final String category;
  int currentPage = 1;
  bool hasReachedMax = false;

  MoviesBloc(this.apiService, this.category)
      : super(const MoviesInitialState()) {
    on<MoviesLoadMovies>((event, emit) async {
      hasReachedMax = false;

      emit(const MoviesLoadingState(data: []));
      currentPage = 1;

      try {
        final response = await apiService.getMovies(category);

        if (response.results.isNotEmpty) {
          emit(MoviesLoadedState(data: response.results));
        } else {
          hasReachedMax = true;
        }
      } catch (e) {
        log(e.toString());
        emit(const MoviesErrorState('Error Loading'));
      }
    });
    on<MoviesLoadMore>((event, emit) async {
      if (hasReachedMax) return;

      emit(MoviesLoadingState(data: state.data));

      currentPage++;

      try {
        final response = await apiService.getMovies(category, currentPage);

        if (response.results.isNotEmpty) {
          final List<MovieResult> data =
              (state.data + response.results).toSet().toList();

          emit(MoviesLoadedState(data: data));
        } else {
          hasReachedMax = true;
        }
      } catch (e) {
        log(e.toString());
        emit(const MoviesErrorState('Error Loading'));
      }
    });
  }
}
