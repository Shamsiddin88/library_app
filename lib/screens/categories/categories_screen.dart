import 'package:flutter/material.dart';
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
        title: const Center(child: Text("Kitob Trlari",textAlign: TextAlign.center)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w(), vertical: 10.h()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                6,
                (index) =>  Column(
                  children: [
                    SizedBox(height: 10.h(),),
                    const CategoriesItem(
                      image: AppImages.books,
                      title: 'Ktob Turi',
                      count: 'ktob soni',
                    ),
                  ],
                )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
