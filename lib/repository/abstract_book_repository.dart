import 'package:flutter_architecture/model/book.dart';

abstract class AbstractBookRepository {
  Future<List<Book>> loadBooks();
}