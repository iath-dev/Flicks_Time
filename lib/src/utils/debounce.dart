import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final Duration duration;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({this.duration = Durations.long2});

  bool get isActive => _timer != null ? _timer!.isActive : false;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(duration, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
