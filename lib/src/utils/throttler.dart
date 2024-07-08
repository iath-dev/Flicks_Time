import 'dart:async';
import 'dart:ui';

class Throttler {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;
  bool _isReady = true;

  Throttler({required this.milliseconds});

  run(VoidCallback action) {
    if (_isReady) {
      action();
      _isReady = false;
      _timer = Timer(Duration(milliseconds: milliseconds), () {
        _isReady = true;
      });
    }
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    _cancelTimer();
  }
}
