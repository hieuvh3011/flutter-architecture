import 'package:event_bus/event_bus.dart';

class EventManager {
  static EventBus _eventBus;

  static EventBus get instance {
    if (_eventBus == null) {
      _eventBus = EventBus();
    }

    return _eventBus;
  }
}