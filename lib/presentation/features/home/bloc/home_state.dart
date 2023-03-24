part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<MovieResult> movies;

  const HomeSuccess(this.movies);

}

class HomeError extends HomeState {
  final String error;

  const HomeError(this.error);
}
