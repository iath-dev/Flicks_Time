import 'package:flicks_time/src/models/arguments.dart';
import 'package:flicks_time/src/services/services.dart';
import 'package:flicks_time/src/state/state.dart';
import 'package:flicks_time/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required this.title,
    required this.category,
  });

  final String title, category;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return BlocProvider(
      create: (context) => MoviesListBloc(category, ApiService(locale: locale))
        ..add(LoadListEvent()),
      child: _Content(title: title, category: category),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.title,
    required this.category,
  });

  final String title, category;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<MoviesListBloc, MoviesListState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: theme.textTheme.titleLarge),
                TextButton(
                    onPressed: () => Navigator.pushNamed(context, 'movies',
                        arguments:
                            MoviesArguments(title: title, category: category)),
                    child: Text(AppLocalizations.of(context)!.more))
              ],
            ),
            Builder(builder: (context) {
              if (state is MoviesListLoaded) {
                return SizedBox(
                  height: 220.0,
                  child: ListView.separated(
                    itemCount: 12,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16.0),
                    itemBuilder: (context, index) =>
                        MovieCard(movie: state.movies[index]),
                  ),
                );
              } else {
                return SizedBox(
                  height: 220.0,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white24,
                      child: Container(
                        height: 240.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white24,
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16.0),
                    itemCount: 4,
                  ),
                );
              }
            }),
          ],
        );
      },
    );
  }
}
