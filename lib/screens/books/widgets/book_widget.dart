import 'package:flutter/material.dart';
import 'package:library_app/utils/images/app_images.dart';
import 'package:library_app/utils/project_extensions.dart';
class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.image,  required this.price, required this.bookName, required this.author});
  final String image;
  final String bookName;
  final String author;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border:
        Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(20.w()),
        // color: Colors.grey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.w(), vertical: 10.h()),
            child: SizedBox(
                height: 165.h(),
                width: 130.w(),
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(20.w()),
                  child: Image.asset(
                    AppImages.book2,
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          SizedBox(
            height: 5.h(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.w()),
            child: Text(
              bookName,
              maxLines: 1,
              style: TextStyle(fontSize: 12.w()),
            ),
          ),
          SizedBox(
            height: 5.h(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.w()),
            child: Text(
              author,
              maxLines: 1,
              style: TextStyle(fontSize: 12.w()),
            ),
          ),
          SizedBox(
            height: 5.h(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.w()),
            child:  Row(
              children: [
                const Text(
                  "\$ ",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.blue),
                ),
                Text(
                  price,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
