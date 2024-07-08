import 'package:flicks_time/src/models/models.dart';
import 'package:flicks_time/src/services/services.dart';
import 'package:flicks_time/src/utils/utils.dart';
import 'package:flicks_time/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MovieArguments;
    final ThemeData theme = Theme.of(context);
    final locale = Localizations.localeOf(context);
    final ApiService service = ApiService(locale: locale);

    return Scaffold(
      body: FutureBuilder<MovieDetailsResponse>(
          future: service.getMovieDetails(args.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildPageShimmer();
            } else if (snapshot.hasError) {
              return _buildErrorPage(
                  context,
                  AppLocalizations.of(context)!
                      .error(snapshot.error.toString()));
            } else if (!snapshot.hasData) {
              return _buildErrorPage(
                  context, AppLocalizations.of(context)!.no_data);
            }

            final data = snapshot.data!;

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 260.0,
                  iconTheme: IconThemeData(color: theme.colorScheme.surface),
                  flexibleSpace: FlexibleSpaceBar(
                    background: _buildBackdrop(data.backdropPath),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList.list(children: [
                    _MovieTitle(
                      title: data.title ?? data.originalTitle,
                      voteAverage: data.voteAverage ?? 0,
                    ),
                    const SizedBox(height: 16.0),
                    Text(formatMinutes(data.runtime),
                        style: theme.textTheme.labelSmall),
                    const SizedBox(height: 16.0),
                    Wrap(
                      spacing: 8.0,
                      children: List.generate(
                        data.genres.length > 3 ? 3 : data.genres.length,
                        (index) => Chip(
                          backgroundColor: theme.colorScheme.primaryContainer,
                          labelStyle: theme.textTheme.labelLarge!.copyWith(
                              color: theme.colorScheme.onPrimaryContainer),
                          label: Text(data.genres[index].name),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _DetailsSection(
                      title: AppLocalizations.of(context)!.overview,
                      child: Text(data.overview,
                          style: theme.textTheme.bodyMedium),
                    ),
                    const SizedBox(height: 16.0),
                    _CastList(args.id),
                    const SizedBox(height: 16.0),
                    _MovieImages(id: args.id),
                    const SizedBox(height: 16.0),
                    _RecommendationsList(args.id),
                  ]),
                )
              ],
            );
          }),
    );
  }

  Widget _buildBackdrop(String? backdropPath) {
    return SizedBox(
      child: Stack(
        children: [
          backdropPath != null
              ? FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  placeholder: 'assets/placeholder_logo.png',
                  image: ImageUtils.getImagePath(backdropPath),
                )
              : Image.asset('assets/placeholder_logo.png', fit: BoxFit.cover),
          Container(
            color: Colors.black12,
            height: double.infinity,
            width: double.infinity,
          )
        ],
      ),
    );
  }

  Widget _buildErrorPage(BuildContext context, dynamic data) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/not_found.png'),
            const SizedBox(height: 16.0),
            Text('Error: $data'),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_left),
              onPressed: () => Navigator.pop(context),
              label: Text(AppLocalizations.of(context)!.back_home),
            )
          ],
        ),
      );

  Widget _buildPageShimmer() => Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white24,
        child: const Column(
          children: [
            SizedBox(height: 260.0, width: double.infinity),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                height: 16.0,
              ),
            ),
          ],
        ),
      );

  String formatMinutes(int minutes) {
    if (minutes <= 0) {
      return '0 min';
    }

    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;

    String hoursString = hours > 0 ? '$hours hr' : '';
    String minutesString = remainingMinutes > 0 ? ' $remainingMinutes min' : '';

    return '$hoursString$minutesString'.trim();
  }
}

class _MovieImages extends StatelessWidget {
  const _MovieImages({
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final ApiService service = ApiService(locale: locale);

    return FutureBuilder<MoviesImages>(
        future: service.getMovieImages(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError ||
              !snapshot.hasData) {
            return const _ListShimmer();
          }

          final data = snapshot.data!;

          if (data.backdrops.isEmpty) {
            return Container();
          }

          return _DetailsSection(
            title: AppLocalizations.of(context)!.images,
            child: SizedBox(
              height: 120.0,
              child: ListView.separated(
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage.assetNetwork(
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: 'assets/placeholder_logo.png',
                      image: ImageUtils.getImagePath(
                          data.backdrops[index].filePath)),
                ),
                itemCount: data.backdrops.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 16.0),
              ),
            ),
          );
        });
  }
}

class _ListShimmer extends StatelessWidget {
  const _ListShimmer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: ListView.separated(
          itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.black38,
              child: Container(
                width: 180.0,
                height: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
              )),
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 16.0)),
    );
  }
}

class _MovieTitle extends StatelessWidget {
  const _MovieTitle({
    required this.title,
    required this.voteAverage,
  });

  final String title;
  final num voteAverage;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        Chip(
          shape: LinearBorder.none,
          avatar: const Icon(Icons.star, color: Colors.yellow),
          labelStyle: theme.textTheme.labelMedium,
          label: Text(voteAverage.toStringAsFixed(2)),
        )
      ],
    );
  }
}

class _RecommendationsList extends StatelessWidget {
  const _RecommendationsList(this.id);

  final int id;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final ApiService service = ApiService(locale: locale);

    return FutureBuilder<ApiResponse>(
        future: service.getMovieRecommendations(id),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting ||
              snap.hasError ||
              !snap.hasData) {
            return const _ListShimmer();
          }

          final data = snap.data!;

          if (data.results.isEmpty) {
            return Container();
          }

          return _DetailsSection(
            title: AppLocalizations.of(context)!.recommendations,
            child: SizedBox(
              height: 200.0,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      MovieCard(movie: data.results[index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16.0),
                  itemCount: data.results.length),
            ),
          );
        });
  }
}

class _CastList extends StatelessWidget {
  const _CastList(this.id);

  final int id;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final ApiService service = ApiService(locale: locale);
    final ThemeData theme = Theme.of(context);

    return FutureBuilder(
        future: service.getMovieCast(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError ||
              !snapshot.hasData) {
            return SizedBox(
              height: 100.0,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white10,
                        child: const SizedBox(
                          width: 80.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                foregroundImage:
                                    AssetImage('assets/avatar.jpeg'),
                              ),
                              SizedBox(
                                height: 12.0,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16.0),
                  itemCount: 6),
            );
          }

          final data = snapshot.data!;

          if (data.cast.isEmpty) {
            return Container();
          }

          return _DetailsSection(
            title: AppLocalizations.of(context)!.casting,
            child: SizedBox(
              height: 100.0,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                        width: 80.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              foregroundImage:
                                  data.cast[index].profilePath != null
                                      ? NetworkImage(
                                          ImageUtils.getImagePath(
                                            data.cast[index].profilePath!,
                                          ),
                                        )
                                      : const AssetImage('assets/avatar.jpeg'),
                            ),
                            Text(
                              data.cast[index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16.0),
                  itemCount: data.cast.length),
            ),
          );
        });
  }
}

class _DetailsSection extends StatelessWidget {
  const _DetailsSection({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.titleLarge),
        const SizedBox(height: 8.0),
        SizedBox(child: child)
      ],
    );
  }
}
