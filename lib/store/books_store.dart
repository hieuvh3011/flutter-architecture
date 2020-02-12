import 'package:flutter_architecture/model/book.dart';
import 'package:flutter_architecture/repository/book_repository/book_repository.dart';
import 'package:mobx/mobx.dart';

part 'books_store.g.dart';

class BooksStore = _BooksStore with _$BooksStore;

abstract class _BooksStore with Store {
  @observable
  bool isLoading = true;

  @observable
  ObservableList<Book> books = ObservableList<Book>();

  @action
  getBooks({bool remoteOnly}) async {
    isLoading = true;

    books.clear();
    BookRepository bookRepository = BookRepository();
    books.addAll(await bookRepository.loadBooks(remoteOnly: remoteOnly ?? false));

    isLoading = false;
  }
}
