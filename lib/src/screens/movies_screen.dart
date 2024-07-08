import 'package:flicks_time/src/models/models.dart';
import 'package:flicks_time/src/services/services.dart';
import 'package:flicks_time/src/state/state.dart';
import 'package:flicks_time/src/utils/utils.dart';
import 'package:flicks_time/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MoviesArguments;
    final locale = Localizations.localeOf(context);
    final ApiService service = ApiService(locale: locale);

    return Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: BlocProvider(
          create: (context) =>
              MoviesBloc(service, args.category)..add(MoviesLoadMovies()),
          child: const _MoviesContent(),
        ));
  }
}

class _MoviesContent extends StatefulWidget {
  const _MoviesContent();

  @override
  State<_MoviesContent> createState() => _MoviesContentState();
}

class _MoviesContentState extends State<_MoviesContent> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesInitialState) {
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: 12,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0),
            itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white24,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white60),
                )),
          );
        } else {
          return Stack(
            children: [
              GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8.0),
                itemCount: state.data.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0),
                itemBuilder: (context, index) => MovieCard(
                  movie: state.data[index],
                ),
              ),
              state is MoviesLoadingState
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: theme.colorScheme.primaryContainer),
                          child: const CircularProgressIndicator.adaptive(
                              strokeWidth: 3.0),
                        ),
                      ),
                    )
                  : Container()
            ],
          );
        }
      },
    );
  }

  void _onScroll() {
    Throttler throttler = Throttler(milliseconds: 500);

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      throttler.run(() {
        context.read<MoviesBloc>().add(MoviesLoadMore());
      });

      throttler.dispose();
    }
  }
}
