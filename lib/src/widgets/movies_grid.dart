import 'package:flicks_time/src/models/models.dart';
import 'package:flicks_time/src/services/services.dart';
import 'package:flicks_time/src/state/state.dart';
import 'package:flicks_time/src/utils/utils.dart';
import 'package:flicks_time/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return BlocProvider(
      create: (context) =>
          MoviesGridCubit(query, ApiService(locale: locale))..fetchData(),
      child: const _MoviesContent(),
    );
  }
}

class _MoviesContent extends StatefulWidget {
  const _MoviesContent();

  @override
  State<_MoviesContent> createState() => _MoviesContentState();
}

class _MoviesContentState extends State<_MoviesContent> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController(keepScrollOffset: true)
      ..addListener(_onScroll);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void _onScroll() {
    Throttler throttler = Throttler(milliseconds: 500);

    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      throttler.run(() {
        context.read<MoviesGridCubit>().fetchMoreData();
      });

      throttler.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesGridCubit, List<MovieResult>>(
      builder: (context, state) {
        return GridView.builder(
          controller: controller,
          padding: const EdgeInsets.all(8.0),
          itemCount: state.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0),
          itemBuilder: (context, index) => MovieCard(movie: state[index]),
        );
      },
    );
  }
}
