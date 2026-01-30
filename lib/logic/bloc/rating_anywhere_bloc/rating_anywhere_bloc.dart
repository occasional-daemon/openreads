import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:openreads/core/constants/enums/enums.dart';

part 'rating_anywhere_event.dart';
part 'rating_anywhere_state.dart';

class RatingAnywhereBloc
    extends HydratedBloc<RatingAnywhereEvent, RatingAnywhereState> {
  RatingAnywhereBloc() : super(RatingAnywhereFinished()) {
    on<RatingAnywhereChange>((event, emit) {
      if (event.ratingAnywhere == RatingAnywhere.all) {
        emit(RatingAnywhereAll());
      } else {
        emit(RatingAnywhereFinished());
      }
    });
  }

  @override
  RatingAnywhereState? fromJson(Map<String, dynamic> json) {
    final ratingAnywhere = json['rating_anywhere'] as String?;

    if (ratingAnywhere == 'all') {
      return RatingAnywhereAll();
    } else {
      return RatingAnywhereFinished();
    }
  }

  @override
  Map<String, dynamic>? toJson(RatingAnywhereState state) {
    if (state is RatingAnywhereAll) {
      return {
        'rating_anywhere': 'all',
      };
    } else {
      return {
        'rating_anywhere': 'finished',
      };
    }
  }
}
