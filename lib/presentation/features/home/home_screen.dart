import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter/data/models/movie_result.dart';
import 'package:movie_flutter/presentation/features/home/home_constant.dart';
import 'package:movie_flutter/presentation/features/home/widgets/home_grid_view_widget.dart';
import 'package:movie_flutter/presentation/widgets/loading_widget.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  HomeBloc get bloc => BlocProvider.of<HomeBloc>(context);
  final _scrollController = ScrollController();
  List<MovieResult> _movies = [];

  @override
  void initState() {
    super.initState();
    bloc.add(const LoadDataMovies(page: 1));
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: HomeConstant.kWhite,
        appBar: AppBar(
          backgroundColor: HomeConstant.kWhite,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: HomeConstant.kBlack),
              ),
              const Text(
                'Back',
                style: TextStyle(
                  color: HomeConstant.kBlack,
                ),
              )
            ],
          ),
          titleSpacing: HomeConstant.kSize0,
          elevation: HomeConstant.kSize0,
        ),
        body: Padding(
          padding: HomeConstant.kPaddingAllIn,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Popular list',
                style: TextStyle(
                    fontSize: HomeConstant.kSize18,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: HomeConstant.kSize20,
              ),
              BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is HomeSuccess) {
                    if (_movies.isNotEmpty) {
                      setState(() {
                        _movies = [..._movies, ...state.movies];
                      });
                    } else {
                      setState(() {
                        _movies = state.movies;
                      });
                    }
                  }
                },
                bloc: bloc,
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    return HomeGridViewWidget(
                      movies: _movies,
                      scrollController: _scrollController,
                    );
                  } else if (state is HomeError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is HomeLoading) {
                    return const LoadingWidget();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ));
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      bloc.add(LoadDataMovies(page: bloc.page + 1));
    }
  }

  @override
  void dispose() {
    bloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
