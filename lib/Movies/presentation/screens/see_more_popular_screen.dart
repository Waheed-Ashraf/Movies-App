import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/movies/presentation/components/see_more_view/movie_item.dart';
import 'package:movies_app/movies/presentation/controller/pobular_movies_cubit/popular_movies_cubit.dart';

class SeeMorePopularMoviesScreen extends StatelessWidget {
  const SeeMorePopularMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Popular Movies'),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
              builder: (context, state) {
                if (state is PopularMoviesLoadedState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.movie.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          GoRouter.of(context).push(
                            AppRouter.kMovieDetailsView,
                            extra: state.movie[index].id,
                          );
                        },
                        child: MovieItem(
                          movie: state.movie[index],
                        ),
                      );
                    },
                  );
                } else if (state is PopularMoviesErrorState) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Center(child: CircularProgressIndicator()));
                }
              },
            ),
          ),
        ],
      ),
    ));
  }
}
