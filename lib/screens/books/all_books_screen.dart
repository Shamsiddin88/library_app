import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/data/models/book_model.dart';
import 'package:library_app/screens/books/add_book_screen.dart';
import 'package:library_app/screens/books/book_info_screen.dart';
import 'package:library_app/utils/project_extensions.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class AllBooksScreen extends StatelessWidget {
  const AllBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("Books"),actions: [IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBookScreen()));}, icon: Icon(Icons.add))],),
      body:context.read<BookViewModel>().isLoading?

      const Center(child: CircularProgressIndicator(),)
          :ListView(children: [

        ...List.generate(context.watch<BookViewModel>().allBooks.length, (index) {
          BookModel books=context.watch<BookViewModel>().allBooks[index];

          return ZoomTapAnimation(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BookInfoScreen(bookModel: books)));},
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(books.author),



                      ],),
                  ),
                  Expanded(child: CachedNetworkImage(imageUrl: books.imageUrl, height: 60,width: 100,))

                ],
              ),
            ),
          );


        })
      ],),
      floatingActionButton: FloatingActionButton(onPressed: (){
      context.read<BookViewModel>().getAllBooks();
    },child:Icon(Icons.add)),);
  }
}




