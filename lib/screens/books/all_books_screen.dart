import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/bloc/file_manager_bloc.dart';
import 'package:library_app/data/models/files/file_data_model.dart';
import 'package:library_app/data/repositories/category_repo.dart';
import 'package:library_app/data/repositories/file_repository.dart';
import 'package:library_app/screens/books/widgets/wrap_item.dart';
import 'package:library_app/utils/project_extensions.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/colors/app_colors.dart';
import 'package:library_app/data/models/book_model.dart';


class AllBooksScreen extends StatefulWidget {
  const AllBooksScreen({super.key});

  @override
  State<AllBooksScreen> createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  FocusNode focus = FocusNode();

  String text = "";

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    List<FileDataModel> users = context.read<FileRepository>().files
        .where((element) =>
        element.bookName.toLowerCase().contains(text.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.c_F9F9F9,
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w(), vertical: 5.h()),
            child: Text("Kitoblar",
                style:
                AppTextStyle.rubikSemiBold.copyWith(color: Colors.black)),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 14,
                      left: 24,
                      bottom: 8,
                      right: focus.hasFocus ? 5 : 24),
                  child: CupertinoTextField(
                    controller: controller,
                    onChanged: (v) {
                      text = v;
                      setState(() {});
                    },
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(.4),
                      ),
                    ),
                    onTap: () {
                      focus.requestFocus();
                      setState(() {});
                    },
                    cursorColor: Colors.blue,
                    focusNode: focus,
                    clearButtonMode: OverlayVisibilityMode.editing,
                    placeholder: " Search",
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.c_29BB89.withOpacity(0.2)),
                  ),
                ),
              ),
              focus.hasFocus
                  ? CupertinoTextSelectionToolbarButton(
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: AppColors.c_29BB89),
                ),
                onPressed: () {
                  text = "";
                  controller.text = "";
                  setState(() {});
                  focus.unfocus();
                },
              )
                  : const SizedBox(),
            ],
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 25.w(), vertical: 5.h()),
          //   child: Text("Kitob turlari",
          //       style:
          //       AppTextStyle.rubikSemiBold.copyWith(color: Colors.black)),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 25.h()),
          //   child: Wrap(
          //     spacing: 11,
          //     children: <Widget>[
          //       ...List.generate(
          //           categories.length,
          //               (index) => WrapItem(
          //             title: categories[index],
          //             onTap: () {
          //             },
          //           )),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 5.h(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w(), vertical: 5.h()),
            child: Text("Hamma Kitoblar",
                style:
                AppTextStyle.rubikSemiBold.copyWith(color: Colors.black)),
          ),


          Expanded(
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
                  childAspectRatio: 0.5,
                  children: [
                    ...List.generate(
                        users.length,
                            (index){
                              FileDataModel fileDataModel = users[index];
                              FileManagerBloc fileManagerBloc = FileManagerBloc();
                          return
                            BlocProvider.value(
                              value: fileManagerBloc,
                              child: BlocBuilder<FileManagerBloc, FileManagerState>(
                                builder: (context, state) {
                                  debugPrint("CURRENT MB: ${state.progress}");
                                  return
                                    InkWell(
                                        borderRadius:
                                        BorderRadius.circular(20.w()),
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) {
                                          //           return BookInfo(bookModel: books,);
                                          //         }));
                                        },
                                        child:  InkWell(
                                          borderRadius: BorderRadius.circular(15),
                                          onTap: (){},
                                          child: Container(
                                              margin: EdgeInsets.symmetric(vertical: 8.h()),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12.w(), vertical: 13.h()),
                                              decoration: BoxDecoration(
                                                color: AppColors.c_29BB89.withOpacity(0.5),
                                                borderRadius: BorderRadius.circular(15.w()),
                                              ),
                                              child:  Column(
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                    child: Text(textAlign: TextAlign.center,
                                                      fileDataModel.author,
                                                      style: TextStyle(fontSize: 16),
                                                    ),
                                                  ),
                                                  10.getH(),
                                                  Image.asset(fileDataModel.imagePath, height: 160.h(),),
                                                  10.getH(),
                                                  Row(
                                                    children: [
                                                      Visibility(
                                                        visible: state.progress != 0,
                                                        child: LinearProgressIndicator(
                                                          value: state.progress,
                                                          backgroundColor: Colors.grey,
                                                        ),
                                                      ),

                                                      Spacer(),
                                                      IconButton(
                                                        onPressed: () async {
                                                          if (state.newFileLocation.isEmpty) {
                                                            fileManagerBloc.add(
                                                              DownloadFileEvent(
                                                                fileDataModel: fileDataModel,
                                                              ),
                                                            );
                                                          } else {
                                                            await OpenFilex.open(state.newFileLocation);
                                                          }
                                                        },
                                                        icon: Icon(
                                                          state.newFileLocation.isEmpty
                                                              ? Icons.download
                                                              : Icons.check,
                                                          color: Colors.blue,
                                                        ),
                                                      ),

                                                    ],
                                                  ),


                                                ],
                                              )),
                                        )
                                    );
                                },
                              ),
                            );

                        })
                  ],
                ),
              ),
            ),
          )
        ],
      ),

    );

  }
}


