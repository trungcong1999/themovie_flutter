part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadDataMovies extends HomeEvent {
  final int page;

  const LoadDataMovies({required this.page});

  @override
  List<Object> get props => [page];
}

class LoadMoreDataMovies extends HomeEvent {}
