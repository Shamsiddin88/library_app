import 'package:flutter/material.dart';
import 'package:library_app/data/models/book_model.dart';
import 'package:library_app/data/repositories/book_repo.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/project_extensions.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import 'package:library_app/utils/utilities.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';


class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});


  @override
  State<AddBookScreen> createState() => _AddBookScreenState();


}

class _AddBookScreenState extends State<AddBookScreen> {
  BookModel bookModel= BookModel.initialValue;
  final BookRepo bookRepo = BookRepo();


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: AppColors.c_29BB89,title: Text("Add product screen"),),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            10.getH(),
            TextField(
              textInputAction: TextInputAction.next,
              onChanged: (v){
                bookModel=bookModel.copyWith(bookName: v);
              },
              decoration:
              InputDecoration(
        
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  fillColor: Colors.white  ,
                  filled: true,
                  hintMaxLines: 4,
        
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "Kitobni nomini kiriting",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))
              ),
            ),
            20.getH(),
            TextField(
              textInputAction: TextInputAction.next,
              onChanged: (v){
                bookModel=bookModel.copyWith(author: v);
              },
              decoration:
              InputDecoration(

                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  fillColor: Colors.white  ,
                  filled: true,
                  hintMaxLines: 4,

                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "Kitobni muallifini kiriting",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))
              ),
            ),
            20.getH(),
            TextField(
              textInputAction: TextInputAction.next,
              onChanged: (v){
                bookModel=bookModel.copyWith(categoryId: int.parse(v));
              },
              decoration:
              InputDecoration(

                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  fillColor: Colors.white  ,
                  filled: true,
                  hintMaxLines: 4,

                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "Kitob kategoriyasini kiriting",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))
              ),
            ),
            20.getH(),
            TextField(
              onChanged: (v){
                bookModel=bookModel.copyWith(price: double.parse(v));
              },
              textInputAction: TextInputAction.next,
              decoration:
              InputDecoration(
        
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  fillColor: Colors.white  ,
                  filled: true,
                  hintMaxLines: 4,
        
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "Kitob narxini kiriting",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))
              ),
            ),
            20.getH(),
            TextField(
              textInputAction: TextInputAction.next,
              onChanged: (v){
                bookModel=bookModel.copyWith(description: v);
              },
              decoration:
              InputDecoration(
        
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  fillColor: Colors.white  ,
                  filled: true,
                  hintMaxLines: 4,
        
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "Kitob tasnifi",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))
              ),
            ),
           20.getH(),
            TextField(
              textInputAction: TextInputAction.done,
              onChanged: (v){
                bookModel=bookModel.copyWith(imageUrl: v);
              },
              decoration:
              InputDecoration(
        
        
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  fillColor: Colors.white  ,
                  filled: true,
                  hintMaxLines: 4,
        
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "Kitob rasmi URL",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))
              ),
            ),
            40.getH(),
            TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors.c_29BB89,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: ()async
                  {
                    if (bookModel.canAddModel()){
                      showSuccessMessage("SUCCESS");

                      context.read<BookViewModel>().addBook(bookModel);
                      Navigator.pop(context);

                    }
                    else {
                      showErrorMessage("ERROR");
                    }
        
        
        
        
                },child: Text("Add", style: AppTextStyle.rubikMedium.copyWith(color: AppColors.white),))
        
        
          ],
        
        ),
      ),
    ),);
  }
}
