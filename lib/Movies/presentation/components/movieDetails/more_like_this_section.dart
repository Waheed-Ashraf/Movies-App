import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/movies/presentation/controller/MoreLikeThisCubit/more_like_this_cubit.dart';
import 'package:shimmer/shimmer.dart';

class MoreLikeThisSection extends StatelessWidget {
  const MoreLikeThisSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreLikeThisCubit, MoreLikeThisState>(
      builder: (context, state) {
        if (state is MoreLikeThisLoadedState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    'More like this'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.recommendation.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return FadeInUp(
                    from: 20,
                    duration: const Duration(seconds: 1),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      child: InkWell(
                        onTap: () {
                          GoRouter.of(context).push(
                            AppRouter.kMovieDetailsView,
                            extra: state.recommendation[index].id,
                          );
                        },
                        child: CachedNetworkImage(
                          imageUrl: ApiConstance.imageUrl(
                              state.recommendation[index].backdropPath == null
                                  ? 'https://placekitten.com/640/360'
                                  : state.recommendation[index].backdropPath!),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          height: 180.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        } else if (state is MoreLikeThisErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const SizedBox(height: 170.0);
        }
      },
    );
  }
}
