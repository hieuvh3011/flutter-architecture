import 'package:flutter_architecture/model/book.dart';
import 'package:flutter_architecture/repository/abstract_book_repository.dart';

class LocalBookRepository implements AbstractBookRepository {
  /// Mock loading books from local database
  @override
  Future<List<Book>> loadBooks() async {
    List<Book> books = [];
    for (int i = 0; i < 10; i++) {
      Book book = Book(
          id: '${i + 1}',
          title: 'Book Title ${i + 1}',
          description: 'Book description ${i + 1}');
      books.add(book);
    }

    await Future.delayed(Duration(seconds: 2));

    return books;
  }

  /// Save books after getting successfully from remote data source.
  saveBooks(List<Book> books) {}
}
