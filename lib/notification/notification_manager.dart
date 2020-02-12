import 'package:flutter_architecture/notification/notification.dart';

class NotificationManager {
  List<Notification> notifications = [];

  /// Add new notification to the list
  void addNotification(Notification notification) {
    notifications.add(notification);
  }

  /// Remove a notification out of the list
  ///
  /// [id] The id of notification which will be removed
  void removeNotification(String id) {
    notifications.removeWhere((notification) {
      return notification.id == id;
    });
  }

  void clearAllNotifications() {
    notifications.clear();
  }

  /// Fire a notification using its id
  ///
  /// [id] The id of the notification which will be fired
  void fireNotification(String id) {
    // Add your logic to fire notification here
  }
}