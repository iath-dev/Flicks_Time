import 'package:flicks_time/src/models/models.dart';
import 'package:flicks_time/src/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesGridCubit extends Cubit<List<MovieResult>> {
  final ApiService service;
  final String query;
  int currentPage = 1;

  MoviesGridCubit(this.query, this.service) : super([]);

  void fetchData() async {
    currentPage = 1;

    final res = await service.searchMovie(query);

    if (res.results.isNotEmpty) {
      emit(res.results);
    }
  }

  void fetchMoreData() async {
    final res = await service.searchMovie(query, currentPage);

    if (res.results.isNotEmpty) {
      final data = (state + res.results).toSet().toList();
      emit(data);
      currentPage++;
    }
  }
}
