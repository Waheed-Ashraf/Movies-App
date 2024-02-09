import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_cubit/movie_details_cubit.dart';

class SliverAppBarSection extends StatelessWidget {
  const SliverAppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
      if (state is MovieDetailsLoadedState) {
        return Column(children: [
          FadeIn(
            duration: const Duration(milliseconds: 500),
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.5, 1.0, 1.0],
                ).createShader(
                  Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.dstIn,
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                imageUrl: ApiConstance.imageUrl(state.movieDetail.backdropPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ]);
      } else if (state is MovieDetailsErrorState) {
        return Center(
          child: Text(state.errorMessage),
        );
      } else {
        return SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            child: const Center(child: CircularProgressIndicator()));
      }
    });
  }
}
