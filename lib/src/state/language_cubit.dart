import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  final Locale initialLocale;

  LanguageCubit(this.initialLocale) : super(initialLocale);

  void changeLocale(Locale locale) {
    emit(locale);
  }
}
