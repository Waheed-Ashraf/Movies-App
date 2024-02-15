import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/components/movieDetails/all_movies_details.dart';
import 'package:movies_app/movies/presentation/components/movieDetails/more_like_this_section.dart';
import 'package:movies_app/movies/presentation/components/movieDetails/sliver_appbar_section.dart';

class MovieDetailBody extends StatelessWidget {
  const MovieDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key('movieDetailScrollView'),
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * .28,
          flexibleSpace:
              const FlexibleSpaceBar(background: SliverAppBarSection()),
        ),
        const SliverToBoxAdapter(
          child: AllMovieDetail(),
        ),
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
          sliver:
              SliverToBoxAdapter(child: Expanded(child: MoreLikeThisSection())),
        ),
      ],
    );
  }
}
