import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/repositories/file_repository.dart';
import 'package:library_app/screens/books/all_books_screen.dart';
import 'package:library_app/services/file_maneger_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FileManagerService();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => FileRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: AllBooksScreen(),
      ),
    );
  }
}
