
import 'package:library_app/data/models/book_model.dart';
import 'package:library_app/data/models/my_response.dart';
import 'package:library_app/data/network/api_provider.dart';

class BookRepo {
  Future<MyResponse> getAllBooks() => ApiProvider.getAllBooks();

  Future<MyResponse> addBook(BookModel bookModel) =>
      ApiProvider.addBook(bookModel);

  Future<MyResponse> deleteBook(String bookUUID) =>
      ApiProvider.deleteBook(bookUUID);

  Future<MyResponse> updateBook(BookModel bookModel) =>
      ApiProvider.updateBook(bookModel);

  Future<MyResponse> getBooksByCategoryId(int categoryId) =>
      ApiProvider.getBooksByCategoryId(categoryId);

  Future<MyResponse> searchBooksByTitle(String title) =>
      ApiProvider.searchBooksByTitle(title);

}
