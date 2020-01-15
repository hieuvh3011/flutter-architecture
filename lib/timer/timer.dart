import 'dart:async';

import 'package:flutter_architecture/event/event_manager.dart';
import 'package:flutter_architecture/event/timer_event.dart';

class AppTimer {
  DateTime startAt;
  DateTime endAt;
  int currentOffset = 0;
  Timer _timer;

  void startTimer(Duration duration) {
    startAt = DateTime.now();
    _timer = Timer.periodic(duration, (timer) {
      currentOffset++;

      EventManager.instance.fire(TimerTickEvent(currentOffset));
    });
  }

  void stopTimer() {
    endAt = DateTime.now();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
