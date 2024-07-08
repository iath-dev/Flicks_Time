import 'package:flicks_time/src/widgets/movies_grid.dart';
import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return MoviesGrid(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return MoviesGrid(query: query);
  }
}
