part of 'movies_list_bloc.dart';

class MoviesListState extends Equatable {
  const MoviesListState();

  @override
  List<Object?> get props => [];
}

class MoviesListInitial extends MoviesListState {
  const MoviesListInitial();
}

class MoviesListLoading extends MoviesListState {
  const MoviesListLoading();
}

class MoviesListError extends MoviesListState {
  const MoviesListError();
}

class MoviesListLoaded extends MoviesListState {
  final List<MovieResult> movies;

  const MoviesListLoaded(this.movies);
}
