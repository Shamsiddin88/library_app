import 'package:flutter/material.dart';
import 'package:library_app/screens/books/all_books_screen.dart';

import 'package:provider/provider.dart';

void main() {

  runApp(MultiProvider(
    providers: [
      ],
    child: MyApp(),
  ));
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
