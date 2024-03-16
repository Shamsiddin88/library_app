import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/data/models/book_model.dart';
import 'package:library_app/data/repositories/book_repo.dart';
import 'package:library_app/screens/books/update_book_screen.dart';
import 'package:library_app/utils/project_extensions.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

class BookInfoScreen extends StatefulWidget {
  const BookInfoScreen({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookInfoScreen> createState() => _BookInfoScreenState();
}

class _BookInfoScreenState extends State<BookInfoScreen> {
  BookRepo bookRepo = BookRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCAF4FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios, color: Colors.black,),),
        title: Text(widget.bookModel.bookName, style: TextStyle(color: Colors.black),),
      ),
      body:
               Container(
                width: double.infinity,
                margin: EdgeInsets.all(24),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(imageUrl:  widget.bookModel.imageUrl, height: 100, width: 150, fit: BoxFit.fill,)),
                    Text(widget.bookModel.bookName , style: TextStyle(fontSize: 22),),
                    SizedBox(height: 12,),
                    Text("Price \$ ${widget.bookModel.price.toString()}", style: TextStyle(fontSize: 22),),
                    10.getH(),
                    Text(widget.bookModel.description),
                    TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UpdateBookScreen(bookModel: widget.bookModel)));}, child: Text('Update')),
                    TextButton(onPressed: (){context.read<BookViewModel>().deleteBook(widget.bookModel.uuid);
                    Navigator.pop(context);}, child: Text('Delete')),
                  ],
                ),
              )


          );


  }
}