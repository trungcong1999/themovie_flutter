import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter/presentation/features/home/interactor/home_interactor.dart';

import '../../../../data/models/movie_result.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeInteractor interactor;
  int page = 1;

  HomeBloc({required this.interactor}) : super(HomeInitial()) {
    on<LoadDataMovies>(_onLoadDataMovies);
  }

  Future<void> _onLoadDataMovies(
      LoadDataMovies event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      final movies = await interactor.getMovies(page: event.page);
      emit(HomeSuccess(movies));
      page = event.page;
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
