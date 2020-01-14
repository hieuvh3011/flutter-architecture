import 'package:flutter_architecture/api/api_response.dart';
import 'package:flutter_architecture/api/book_api.dart';
import 'package:flutter_architecture/model/book.dart';
import 'package:mobx/mobx.dart';

part 'books_store.g.dart';

class BooksStore = _BooksStore with _$BooksStore;

abstract class _BooksStore with Store {
  @observable
  bool isLoading = true;

  @observable
  ObservableList<Book> books = ObservableList<Book>();

  @action
  getBooks() async {
    isLoading = true;

    BookApi api = BookApi();
    ApiResponse apiResponse = await api.getBooks();
    books.clear();
    books.addAll(apiResponse?.model);

    isLoading = false;
  }
}