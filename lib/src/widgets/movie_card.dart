import 'package:animate_do/animate_do.dart';
import 'package:flicks_time/src/models/models.dart';
import 'package:flicks_time/src/utils/images_utils.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final MovieResult movie;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return FadeIn(
      duration: Durations.medium2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Material(
          elevation: 4,
          shadowColor: Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, 'movie',
                arguments: MovieArguments(movie.id)),
            child: SizedBox(
              width: 150.0,
              height: 240.0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  movie.posterPath != null
                      ? FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: 'assets/placeholder_logo_alt.png',
                          image: ImageUtils.getImagePath(movie.posterPath!))
                      : Image.asset('assets/placeholder_logo_alt.png',
                          fit: BoxFit.cover),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        theme.colorScheme.surface.withOpacity(.7)
                      ],
                    )),
                    child: Text(
                      movie.title ?? movie.originalTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelMedium!
                          .copyWith(color: theme.colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
