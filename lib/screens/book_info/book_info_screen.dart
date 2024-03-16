import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_app/utils/project_extensions.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
class BookInfo extends StatefulWidget {
  const BookInfo({super.key});

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_F9F9F9,
      appBar: AppBar(
        backgroundColor: AppColors.c_29BB89,
        title: Center(child: Text("Ktob malumotlari",style: TextStyle(color: Colors.black),)),
      ),
      body: Stack(
        children: [
          Container(width: double.infinity,
          height: double.infinity,color: AppColors.transparent,),

          SingleChildScrollView(
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
                            child: Image.asset(
                              AppImages.book2,
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
                            child: const Text("Ktob Nomis",maxLines:1),
                          ),
                          SizedBox(
                            height: 5.h(),
                          ),
                          Container(
                            width: 160,

                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w()),
                              child: Text("O'tgan Kunlar",maxLines:1,style: AppTextStyle.rubikBold.copyWith(fontSize: 20,color: Colors.black),),
                            ),
                          ),
                          SizedBox(
                            height: 5.h(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w()),
                            child: const Text("Mu'allif"),
                          ),
                          SizedBox(
                            height: 5.h(),
                          ),
                          Container(
                            width: 160,

                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w()),
                              child: Text("Abdulla Qodiri",style: AppTextStyle.rubikBold.copyWith(fontSize: 20,color: Colors.black),),
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
                            child: const Row(
                              children: [
                                Text(
                                  "\$ ",
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.blue),
                                ),
                                Text(
                                  "1865",
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
                  child: const Text("Ktob haqida",),
                ),
                SizedBox(height: 10.h(),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w()),
                  child:  Text("ISBNdb gathers data from hundreds of libraries, publishers, merchants and other sources around the globe to compile a vast collection of unique book data searchable by ISBN, title, author, or publisher. Get a FREE 7 day trial and get access to the full database of 33 + million books and all data points including title, author, publisher, publish date, binding, pages, ISBNdb gathers data from hundreds of libraries, publishers, merchants and other sources around the globe to compile a vast collection of unique book data searchable by ISBN, title, author, or publisher. Get a FREE 7 day trial and get access to the full database of 33 + million books and all data points including title, author, publisher, publish date, binding, pages, lilist price, and more.",style: AppTextStyle.rubikSemiBold.copyWith(color: Colors.black)),
                ),

              ],
            ),
          ),
          Positioned(
            bottom: 10.h(),
            right: 25.w(),
            left: 25.w(),

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
                                  child: Text('Yopish'),
                                ),
                                TextButton(
                                  onPressed: () async {},
                                  child: Text('Davom'),
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
          ),

        ],
      )
    );
  }
}
