part of 'rating_anywhere_bloc.dart';

abstract class RatingAnywhereState extends Equatable {
  const RatingAnywhereState();

  @override
  List<Object> get props => [];
}

class RatingAnywhereFinished extends RatingAnywhereState {}

class RatingAnywhereAll extends RatingAnywhereState {}
