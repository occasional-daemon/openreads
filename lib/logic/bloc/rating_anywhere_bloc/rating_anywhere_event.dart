part of 'rating_anywhere_bloc.dart';

abstract class RatingAnywhereEvent extends Equatable {
  const RatingAnywhereEvent();
}

class RatingAnywhereChange extends RatingAnywhereEvent {
  final RatingAnywhere ratingAnywhere;

  const RatingAnywhereChange({required this.ratingAnywhere});

  @override
  List<Object?> get props => [ratingAnywhere];
}
