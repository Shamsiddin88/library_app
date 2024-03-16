import 'package:flutter/material.dart';
import 'package:library_app/data/models/book_model.dart';
import 'package:library_app/data/repositories/category_repo.dart';
import 'package:library_app/screens/book_info/book_info_screen.dart';
import 'package:library_app/screens/categories/widget_items/categories_item.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/images/app_images.dart';
import 'package:library_app/utils/project_extensions.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.category});
  final Future category;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_F9F9F9,
      appBar: AppBar(
        backgroundColor: AppColors.c_29BB89,
        title: const Center(
            child: Text("Kitob Turlari", textAlign: TextAlign.center)),
      ),
      body: context.read<BookViewModel>().isLoading?

      const Center(child: CircularProgressIndicator(),)
          :Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w()),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(25),
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              children: [
                ...List.generate(
                    context.watch<BookViewModel>().allBooks.length,
                  (index)
                  {
                    BookModel books=context.watch<BookViewModel>().allBooks[index];
                    return
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return BookInfo(
                                        bookModel: books,
                                      );
                                    }));
                                  },
                                  child: CategoriesItem(
                                    image: books.imageUrl,
                                    price: books.price.toString(),
                                    bookName: books.bookName,
                                    author: books.author,
                                  ),
                                );
                              }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
