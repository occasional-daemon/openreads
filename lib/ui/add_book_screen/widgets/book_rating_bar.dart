import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:openreads/core/constants/constants.dart';
import 'package:openreads/core/constants/enums/enums.dart';
import 'package:openreads/core/themes/app_theme.dart';
import 'package:openreads/logic/cubit/edit_book_cubit.dart';
import 'package:openreads/logic/bloc/rating_anywhere_bloc/rating_anywhere_bloc.dart';
import 'package:openreads/model/book.dart';

class BookRatingBar extends StatelessWidget {
  const BookRatingBar({
    super.key,
    required this.animDuration,
  });

  final Duration animDuration;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<EditBookCubit>().state;
        final rating_anywhere = context.watch<RatingAnywhereBloc>().state;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AnimatedContainer(
                duration: animDuration,
                height: ((state.status == BookStatus.read) ||
                        (rating_anywhere is RatingAnywhereAll))
                    ? Constants.formHeight
                    : 0,
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withOpacity(0.5),
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                  child: Center(
                    child: RatingBar.builder(
                      unratedColor: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerLow,
                      initialRating:
                          (state.rating == null) ? 0.0 : state.rating! / 10,
                      allowHalfRating: true,
                      glow: false,
                      glowRadius: 1,
                      itemSize: 42,
                      itemPadding: const EdgeInsets.all(5),
                      wrapAlignment: WrapAlignment.center,
                      itemBuilder: (_, __) => Icon(
                        Icons.star_rounded,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      onRatingUpdate: (rating) {
                        FocusManager.instance.primaryFocus?.unfocus();

                        context.read<EditBookCubit>().setRating(rating);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
