part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<MovieResult> data;

  const MoviesState({this.data = const []});

  @override
  List<Object?> get props => [data];
}

class MoviesInitialState extends MoviesState {
  const MoviesInitialState();

  @override
  List<Object> get props => [data];
}

class MoviesErrorState extends MoviesState {
  final String msg;

  const MoviesErrorState(this.msg, {super.data = const []});

  @override
  List<Object> get props => [msg, data];
}

class MoviesLoadingState extends MoviesState {
  const MoviesLoadingState({super.data = const []});

  @override
  List<Object> get props => [data];
}

class MoviesLoadedState extends MoviesState {
  const MoviesLoadedState({required super.data});

  @override
  List<Object> get props => [data];
}
