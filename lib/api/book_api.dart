import 'package:flutter_architecture/api/api.dart';
import 'package:flutter_architecture/api/api_response.dart';

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
  }
}