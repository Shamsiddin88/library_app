import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_app/data/models/book_model.dart';
import 'package:library_app/data/models/my_response.dart';
import 'package:library_app/utils/constants/app_constant.dart';
import '../../utils/constants/app_constant.dart';

class ApiProvider {
  static Future<MyResponse> getAllBooks() async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/books");
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return MyResponse(
          data: (jsonDecode(response.body)["items"] as List?)
                  ?.map((e) => BookModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }
  static Future<MyResponse> getBooksByCategoryId(int categoryId) async {
    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/api/v1/books",
    );
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        List<BookModel> filteredBooks = [];
        List<dynamic> booksJson = jsonDecode(response.body)["items"];

        // Filter books by category ID
        for (var bookJson in booksJson) {
          if (bookJson["category_id"] == categoryId) {
            filteredBooks.add(BookModel.fromJson(bookJson));
          }
        }

        return MyResponse(data: filteredBooks);
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> addBook(BookModel productModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/books");
    try {
      http.Response response = await http.post(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([productModel.toJson()]),
      );
      if (response.statusCode == 201) {
        return MyResponse(data: "Product added successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> deleteBook(String productUUID) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/books");
    try {
      http.Response response = await http.delete(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([
          {"_uuid": productUUID}
        ]),
      );
      if (response.statusCode == 200) {
        return MyResponse(data: "Product deleted successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> updateBook(BookModel productModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/books");
    try {
      http.Response response = await http.put(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([productModel.toJsonForUpdate()]),
      );
      if (response.statusCode == 200) {
        return MyResponse(data: "Product updated successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> searchBooksByTitle(String title) async {
    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/api/v1/books",
      {"title": title}, // Query parameter sifatida title ni uzatamiz
    );
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        List<BookModel> searchedBooks = [];
        List<dynamic> booksJson = jsonDecode(response.body)["items"];

        // Filter books by title
        for (var bookJson in booksJson) {
          if (bookJson["title"].toLowerCase().contains(title.toLowerCase())) {
            searchedBooks.add(BookModel.fromJson(bookJson));
          }
        }

        return MyResponse(data: searchedBooks);
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

}
