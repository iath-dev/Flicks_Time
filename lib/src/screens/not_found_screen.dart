import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/not_found.png')),
            const SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, 'home', (route) => false),
                child: Text(AppLocalizations.of(context)!.back_home))
          ],
        ),
      ),
    );
  }
}
