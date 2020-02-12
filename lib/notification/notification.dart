class Notification<T> {
  final String id;
  final String source;
  final T data;

  /// Notification
  /// [id] The id of notification
  /// [data] The content/data of notification
  /// [source] Where the notification from (Firebase, One signal, local...)
  Notification(this.id, this.data, this.source);
}