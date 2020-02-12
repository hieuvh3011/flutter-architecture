import 'package:flutter_architecture/model/book.dart';
import 'package:flutter_architecture/repository/book_repository/abstract_book_repository.dart';
import 'package:flutter_architecture/repository/book_repository/local_book_repository.dart';
import 'package:flutter_architecture/repository/book_repository/remote_book_repository.dart';

class BookRepository implements AbstractBookRepository {
  @override
  Future<List<Book>> loadBooks({bool remoteOnly}) async {
    LocalBookRepository localBookRepository = LocalBookRepository();
    RemoteBookRepository remoteBookRepository = RemoteBookRepository();

    if (remoteOnly) {
      final books = await remoteBookRepository.loadBooks();

      await localBookRepository.saveBooks(books);

      return books;
    } else {
      try {
        return await localBookRepository.loadBooks();
      } catch (e) {
        final books = await remoteBookRepository.loadBooks();

        await localBookRepository.saveBooks(books);

        return books;
      }
    }
  }
}
