import 'package:flutter/material.dart';
import 'package:library_app/utils/colors/app_colors.dart';

import 'package:library_app/utils/project_extensions.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key, required this.image, required this.title, required this.count});
  final String image;
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(20.w()),
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 15.h()),
        width: double.infinity,
        height: 100.h(),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.c_29BB89,
          ),
          borderRadius: BorderRadius.circular(20.w()),
        ),
        child: Center(
          child: ListTile(
            leading: Image.asset(image),
            title: Text(title),
            trailing: Text(count),
          ),
        ),
      ),
    );
  }
}
