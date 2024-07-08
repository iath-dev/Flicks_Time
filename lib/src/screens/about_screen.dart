import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.about),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('The Movie Database'),
            subtitle: Text(AppLocalizations.of(context)!.tmdb_description),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/tmdb_short_logo.png')),
          ),
          ListTile(
            title: const Text('Freepik.com'),
            subtitle: Text(AppLocalizations.of(context)!.freepik_description),
          ),
          ListTile(
            title: const Text('Storyset.com'),
            subtitle: Text(AppLocalizations.of(context)!.storyset_description),
          ),
          // ... Más elementos de la lista
        ],
      ),
    );
  }
}
