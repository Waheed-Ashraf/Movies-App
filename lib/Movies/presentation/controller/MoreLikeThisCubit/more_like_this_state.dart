part of 'more_like_this_cubit.dart';

sealed class MoreLikeThisState extends Equatable {
  const MoreLikeThisState();

  @override
  List<Object> get props => [];
}

final class MoreLikeThisInitial extends MoreLikeThisState {}

final class MoreLikeThisLoadingState extends MoreLikeThisState {}

final class MoreLikeThisLoadedState extends MoreLikeThisState {
  final List<Recommendation> recommendation;

  const MoreLikeThisLoadedState({required this.recommendation});
}

final class MoreLikeThisErrorState extends MoreLikeThisState {
  final String errorMessage;

  const MoreLikeThisErrorState({required this.errorMessage});
}
