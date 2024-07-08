import 'package:flicks_time/src/models/models.dart';
import 'package:flicks_time/src/services/services.dart';
import 'package:flicks_time/src/state/state.dart';
import 'package:flicks_time/src/utils/images_utils.dart';
import 'package:flicks_time/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.welcome),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, 'about'),
              icon: const Icon(Icons.info)),
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: const Icon(Icons.search)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          children: [
            const _PremiereSlider(),
            const SizedBox(height: 16.0),
            MovieList(
                title: AppLocalizations.of(context)!.playing,
                category: 'now_playing'),
            const SizedBox(height: 16.0),
            MovieList(
                title: AppLocalizations.of(context)!.popular,
                category: 'popular'),
            const SizedBox(height: 16.0),
            MovieList(
                title: AppLocalizations.of(context)!.upcoming,
                category: 'upcoming'),
          ],
        ),
      ),
    );
  }
}

class _PremiereSlider extends StatelessWidget {
  const _PremiereSlider();

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return BlocProvider(
      create: (context) =>
          MoviesListBloc('top_rated', ApiService(locale: locale))
            ..add(LoadListEvent()),
      child: const _PremiereSliderContent(),
    );
  }
}

class _PremiereSliderContent extends StatelessWidget {
  const _PremiereSliderContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesListBloc, MoviesListState>(
      builder: (context, state) {
        if (state is MoviesListLoaded) {
          return Carrousel(
            borderRadius: BorderRadius.circular(16.0),
            height: 240.0,
            children: List.generate(state.movies.length,
                (index) => _SliderItem(movie: state.movies[index])),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white70,
            child: Container(
              height: 240.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white24,
              ),
            ),
          );
        }
      },
    );
  }
}

class _SliderItem extends StatelessWidget {
  const _SliderItem({
    required this.movie,
  });

  final MovieResult movie;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () => Navigator.pushNamed(context, 'movie',
          arguments: MovieArguments(movie.id)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          movie.backdropPath != null
              ? FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  placeholder: 'assets/placeholder_logo.png',
                  image: ImageUtils.getImagePath(movie.backdropPath!))
              : Image.asset('assets/placeholder_logo.png', fit: BoxFit.cover),
          Container(
            color: Colors.black12,
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              movie.title ?? movie.originalTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
