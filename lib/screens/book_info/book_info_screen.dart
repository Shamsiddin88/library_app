import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:library_app/data/models/book_model.dart';
import 'package:library_app/data/repositories/book_repo.dart';
import 'package:library_app/screens/books/update_book_screen.dart';
import 'package:library_app/utils/project_extensions.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
class BookInfo extends StatefulWidget {
  const BookInfo({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  @override
  Widget build(BuildContext context) {
    BookRepo bookRepo = BookRepo();
    return Scaffold(
      backgroundColor: AppColors.c_F9F9F9,
      appBar: AppBar(
        backgroundColor: AppColors.c_29BB89,
        title: Center(child: Text("Kitob malumotlari",style: TextStyle(color: Colors.black),)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w(), vertical: 10.h()),
                        child: SizedBox(
                            height: 300.h(),
                            width: 200.w(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.w()),
                              child: Image.network(
                                widget.bookModel.imageUrl,
                                fit: BoxFit.fill,
                              ),
                            )),
                      ),
            
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10.h()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
            
                          children: [
                            SizedBox(
                              height: 5.h(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w()),
                              child: const Text("Kitob Nomi",maxLines:1),
                            ),
                            SizedBox(
                              height: 5.h(),
                            ),
                            Container(
                              width: 160,
            
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w()),
                                child: Text(widget.bookModel.bookName,maxLines:1,style: AppTextStyle.rubikBold.copyWith(fontSize: 20,color: Colors.black),),
                              ),
                            ),
                            SizedBox(
                              height: 5.h(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w()),
                              child: const Text("Muallif"),
                            ),
                            SizedBox(
                              height: 5.h(),
                            ),
                            Container(
                              width: 160,
            
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w()),
                                child: Text(widget.bookModel.author,style: AppTextStyle.rubikBold.copyWith(fontSize: 20,color: Colors.black),),
                              ),
                            ),
                            SizedBox(
                              height: 5.h(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w()),
                              child: const Text("Narxi"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w()),
                              child: Row(
                                children: [
                                  Text(
                                    "SUM ",
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.blue),
                                  ),
                                  Text(
                                    widget.bookModel.price.toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
            
                  SizedBox(height: 15.h(),),
            
                  /**Manashu pekichni ishlatsak bolarkan**/
            
                  Center(
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  SizedBox(height: 10.h(),),
            
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w()),
                    child: const Text("Kitob haqida",),
                  ),
                  SizedBox(height: 10.h(),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w()),
                    child:  Text(widget.bookModel.description,style: AppTextStyle.rubikSemiBold.copyWith(color: Colors.black)),
                  ),
            
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w(),vertical: 5.h()),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    print("bosildi");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Ogoxlantrish!!!',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20.w(),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          content: Text(
                            'Ishonchingiz komilmi???',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 18.w(),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Yo'q"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    context.read<BookViewModel>().deleteBook(widget.bookModel.uuid);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ha'),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                  borderRadius:BorderRadius.circular(20.w()),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w(),vertical: 10.h()),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w()),
                      color:  AppColors.c_29BB89,
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.delete,color: Colors.red,),
                        Text(" O'Chirish",style: TextStyle(
                            fontSize: 20,
                            color: Colors.red
                        ),)
                      ],
                    ),
                  ),
                ),
                // SizedBox(width: 20.w(),),
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UpdateBookScreen(bookModel: widget.bookModel)));

                  },
                  borderRadius:BorderRadius.circular(20.w()),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w(),vertical: 10.h()),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w()),
                      color:  AppColors.c_29BB89,
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.update, color: Colors.red,),
                        Text(" O'zgartrish",style: TextStyle(
                            fontSize: 20,
                            color: Colors.red
                        ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
