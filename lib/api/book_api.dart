import 'package:flutter_architecture/api/api.dart';
import 'package:flutter_architecture/api/api_response.dart';
import 'package:flutter_architecture/model/book.dart';

class BookApi extends Api {
  static const BOOK_API_PATH = '/volumes?q=programming';

  Future<ApiResponse> getBooks() async {
    ApiResponse apiResponse = await doGet(BOOK_API_PATH);

    if (apiResponse.success) {
      apiResponse.model = _parseBooksData(apiResponse.rawData);
    }

    return apiResponse;
  }

  _parseBooksData(rawData) {
    print(rawData);
    List items = rawData['items'];
    List<Book> books = [];
    if (items != null) {
      items.forEach((item) {
        books.add(Book.fromMap(item));
      });
    }

    return books;
  }
}
