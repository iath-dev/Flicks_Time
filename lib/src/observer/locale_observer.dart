import 'package:flicks_time/src/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleObserver extends WidgetsBindingObserver {
  final BuildContext context;

  LocaleObserver(this.context);

  @override
  void didChangeLocales(List<Locale>? locales) {
    if (locales != null && locales.isNotEmpty) {
      final Locale newLocale = locales.first;
      context.read<LanguageCubit>().changeLocale(newLocale);
    }
  }
}
