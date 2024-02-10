import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/movies/presentation/components/see_more_view/movie_item.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_cubit/top_rated_cubit.dart';

class SeeMoreTopRatedMoviesScreen extends StatelessWidget {
  const SeeMoreTopRatedMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Top Rated Movies'),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<TopRatedCubit, TopRatedState>(
              builder: (context, state) {
                if (state is TopRatedLoadedState) {
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
                } else if (state is TopRatedErrorState) {
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
