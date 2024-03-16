import 'package:flutter/material.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/project_extensions.dart';
class WrapItem extends StatelessWidget {
  const WrapItem({super.key, required this.title, required this.onTap});
   final String title;
   final VoidCallback  onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 4.h()),
          padding: EdgeInsets.symmetric(
              horizontal: 12.w(), vertical: 6.h()),
          decoration: BoxDecoration(
            color: AppColors.c_29BB89.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.w()),
          ),
          child:  Text(
            title,
            style: TextStyle(fontSize: 18),
          )),
    );
  }
}
