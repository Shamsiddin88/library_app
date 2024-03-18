import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/book_model.dart';
import 'package:library_app/data/models/my_response.dart';
import 'package:library_app/data/repositories/book_repo.dart';

class BookViewModel extends ChangeNotifier {
  List<BookModel> allBooks = [];
  List<BookModel> filteredBooks = [];

  String statusText = "";
  bool isLoading = false;

  final BookRepo bookRepo;

  BookViewModel({required this.bookRepo}){
    getAllBooks();
  }

  Future<void> getAllBooks() async {
    _notify(true);
    MyResponse myResponse = await bookRepo.getAllBooks();
    _notify(false);
    if (myResponse.errorText.isEmpty) {
      allBooks = myResponse.data as List<BookModel>;
      filteredBooks = List.from(allBooks);
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> addBook(BookModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await bookRepo.addBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> updateBook(BookModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await bookRepo.updateBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> deleteBook(String bookUUID) async {
    _notify(true);
    MyResponse myResponse = await bookRepo.deleteBook(bookUUID);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> getBooksByCategoryId(int categoryId) async {
    _notify(true);
    MyResponse myResponse = await bookRepo.getBooksByCategoryId(categoryId);
    _notify(false);
    if (myResponse.errorText.isEmpty) {
      allBooks = myResponse.data as List<BookModel>;
      filteredBooks = List.from(allBooks);
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future <void> searchBooks(String query) async {
    if (query.isEmpty) {
      filteredBooks = List.from(allBooks);
    } else {
      filteredBooks = allBooks
          .where((book) => book.bookName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }



  void _notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
