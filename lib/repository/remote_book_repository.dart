import 'package:flutter_architecture/api/api_response.dart';
import 'package:flutter_architecture/api/book_api.dart';
import 'package:flutter_architecture/model/book.dart';
import 'package:flutter_architecture/repository/abstract_book_repository.dart';

class RemoteBookRepository implements AbstractBookRepository {
  @override
  Future<List<Book>> loadBooks() async {
    List<Book> books = [];

    /// Load books from remote backend database
    BookApi api = BookApi();
    ApiResponse apiResponse = await api.getBooks();

    if (apiResponse != null) {
      books = apiResponse.model;
    }

    return books;
  }
}
