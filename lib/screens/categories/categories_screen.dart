import 'package:flutter/material.dart';
import 'package:library_app/screens/book_info/book_info_screen.dart';
import 'package:library_app/screens/categories/widget_items/categories_item.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/images/app_images.dart';
import 'package:library_app/utils/project_extensions.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_F9F9F9,
      appBar: AppBar(
        backgroundColor: AppColors.c_29BB89,
        title: const Center(
            child: Text("Kitob Trlari", textAlign: TextAlign.center)),
      ),
      body: Expanded(
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
                  (index) =>  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context){
                        return const BookInfo();
                      }));
                    },
                    child: const CategoriesItem(
                      image: 'https://kitobxon.com/img_knigi/564.jpg',
                      price: '2500',
                      bookName: 'vaxt',
                      author: 'Abdulla qodri',
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
