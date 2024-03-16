import 'package:flutter/material.dart';
import 'package:library_app/screens/book_info/book_info_screen.dart';
import 'package:library_app/screens/books/widgets/book_widget.dart';
import 'package:library_app/screens/books/widgets/wrap_item.dart';
import 'package:library_app/screens/categories/categories_screen.dart';
import 'package:library_app/utils/images/app_images.dart';
import 'package:library_app/utils/project_extensions.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import '../../utils/colors/app_colors.dart';

class AllBooksScreen extends StatelessWidget {
  const AllBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor:  AppColors.c_29BB89,
        onPressed: () {  },
        child: IconButton(onPressed: (){},icon: Icon(Icons.add),),
      ),
      backgroundColor: AppColors.c_F9F9F9,
      body: Column(
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
            child: Text("Ktoblar olamiga",
                style:
                    AppTextStyle.rubikSemiBold.copyWith(color: Colors.black)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w()),
            child: TextField(
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
                hintText: "Qidrish",
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
            child: Text("Ktob Turlari",
                style:
                    AppTextStyle.rubikSemiBold.copyWith(color: Colors.black)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.h()),
            child: Wrap(
              spacing: 11, // qatlar orasidagi bo'sh joy
              // qatlar orasidagi bo'sh joy
              children: <Widget>[
                ...List.generate(
                    5,
                    (index) => WrapItem(
                          title: 'Tarixiy',
                          voidCallback: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const CategoriesScreen();
                            }));
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
            child: Text("Hamma Ktoblar",
                style:
                    AppTextStyle.rubikSemiBold.copyWith(color: Colors.black)),
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
                  childAspectRatio: 0.7,
                  children: [
                    ...List.generate(
                        10,
                        (index) => InkWell(
                            borderRadius: BorderRadius.circular(20.w()),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const BookInfo();
                              }));
                            },
                            child: const BookItem(
                              image: AppImages.book2,
                              price: "2500",
                              bookName: "O'tgan Kular",
                              author: "Abdulla Qodri",
                            )))
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
