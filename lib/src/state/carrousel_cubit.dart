import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class CarrouselCubit extends Cubit<int> {
  final int itemCount;
  final Duration duration;
  Timer? _timer;

  CarrouselCubit(
      {required this.itemCount, this.duration = const Duration(seconds: 3)})
      : super(0) {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(duration, (timer) {
      _nextPage();
    });
  }

  void _nextPage() {
    final nextIndex = (state + 1) % itemCount;
    emit(nextIndex);
    resetTimer();
  }

  void nextPage() {
    _nextPage();
  }

  void previousPage() {
    final nextIndex = (state - 1) % itemCount;
    emit(nextIndex);
    resetTimer();
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void resetTimer() {
    stopTimer();
    _startTimer();
  }

  void manualChange(int index) {
    stopTimer();
    emit(index % itemCount);
    resetTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
