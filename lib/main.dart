import 'package:flutter/material.dart';
import 'package:library_app/data/network/api_provider.dart';
import 'package:library_app/data/repositories/book_repo.dart';
import 'package:library_app/screens/books/all_books_screen.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => BookViewModel(bookRepo: BookRepo()),)
    ], child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: AllBooksScreen(),
    );
  }
}
