import 'package:meta/meta.dart';

class Book {
  static const TITLE = 'title';
  static const URL = 'url';
  static const ID = 'id';
  static const NOTES = 'notes';
  static const STAR = 'star';
  static const AUTHOR = 'author';
  static const DESCRIPTION = 'description';
  static const SUBTITLE = 'subtitle';
  static const VOLUME_INFO = 'volumeInfo';

  final String title;
  final String url;
  final String id;
  final String author;
  final String description;
  final String subtitle;

  Book({
    @required this.title,
    this.url,
    @required this.id,
    this.author,
    @required this.description,
    this.subtitle,
  });

  Book.fromMap(Map<String, dynamic> map)
      : this(
          title: map[VOLUME_INFO][TITLE] ?? '',
          url: map[URL],
          id: map[ID],
          description: map[VOLUME_INFO][DESCRIPTION] ?? '',
          author: map[AUTHOR],
          subtitle: map[SUBTITLE],
        );

  Map<String, dynamic> toMap() {
    return {
      TITLE: title,
      URL: url,
      ID: id,
      DESCRIPTION: description,
      AUTHOR: author,
      SUBTITLE: subtitle,
    };
  }
}
