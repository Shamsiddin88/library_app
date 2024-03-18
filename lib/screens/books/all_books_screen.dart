import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/data/repositories/category_repo.dart';
import 'package:library_app/screens/book_info/book_info_screen.dart';
import 'package:library_app/screens/books/widgets/book_widget.dart';
import 'package:library_app/screens/books/widgets/wrap_item.dart';
import 'package:library_app/screens/categories/categories_screen.dart';
import 'package:library_app/utils/project_extensions.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import '../../utils/colors/app_colors.dart';
import 'package:library_app/data/models/book_model.dart';
import 'package:library_app/screens/books/add_book_screen.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';


class AllBooksScreen extends StatelessWidget {
  const AllBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    final bookViewModel = context.watch<BookViewModel>();
    final allBooks = bookViewModel.allBooks;
    List<BookModel> filteredBooks = allBooks;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor:  AppColors.c_29BB89,
        onPressed: () {  },
        child: IconButton(onPressed: (){context.read<BookViewModel>().getAllBooks();},icon: Text("All"),),
      ),
      backgroundColor: AppColors.c_F9F9F9,
      body:context.watch<BookViewModel>().isLoading?
      const Center(child: CircularProgressIndicator(),)
          :
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h(), horizontal: 18.w()),
            child: Text(
              "Hush kelibsiz",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w(), vertical: 5.h()),
            child: Text("Kitoblar olamiga",
                style:
                    AppTextStyle.rubikSemiBold.copyWith(color: Colors.black)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w()),
            child: TextField(
              onChanged: (value) {
                context.watch<BookViewModel>().searchBooks(value);

              },
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                fillColor: Colors.transparent,
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                hintText: "Qidirish",
                hintStyle: const TextStyle(color: Colors.black, fontSize: 14),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.black),
                    borderRadius: BorderRadius.circular(12)),
                disabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.black.withOpacity(.6)),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.black.withOpacity(.6)),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w(), vertical: 5.h()),
            child: Text("Kitob turlari",
                style:
                    AppTextStyle.rubikSemiBold.copyWith(color: Colors.black)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.h()),
            child: Wrap(
              spacing: 11,
              children: <Widget>[
                ...List.generate(
                    categories.length,
                    (index) => WrapItem(
                          title: categories[index],
                          onTap: () {
                            category: context.read<BookViewModel>().getBooksByCategoryId(index+1);
                          },
                        )),
              ],
            ),
          ),
          SizedBox(
            height: 5.h(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w(), vertical: 5.h()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hamma Kitoblar",
                    style:
                        AppTextStyle.rubikSemiBold.copyWith(color: Colors.black)),
                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBookScreen()));}, child: Text("+ Kitob qo'shish", style: AppTextStyle.rubikBold.copyWith(color: AppColors.c_29BB89),))
              ],
            ),
          ),
          Expanded(
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
                        filteredBooks.length,
                        (index){
                          BookModel books=filteredBooks[index];
                          return
                                    InkWell(
                                        borderRadius:
                                            BorderRadius.circular(20.w()),
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return BookInfo(bookModel: books,);
                                          }));
                                        },
                                        child: BookItem(
                                          image: books.imageUrl,
                                          price: books.price.toString(),
                                          bookName: books.bookName,
                                          author: books.author,
                                        ));
                                  })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );

  }
}




