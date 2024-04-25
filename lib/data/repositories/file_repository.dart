
import 'package:library_app/data/models/files/file_data_model.dart';
import 'package:library_app/utils/images/app_images.dart';

class FileRepository {
  List<FileDataModel> files = [
    FileDataModel(
      imagePath: AppImages.borisGodunov,
      bookName: "Boris Godunov (drama)",
      fileUrl: "https://www.ziyouz.com/books/jahon_dramaturgiyasi/Aleksandr%20Pushkin.%20Boris%20Godunov%20(drama).pdf", 
      author: 'Aleksandr Pushkin.', categoryId: 2,
    ),
    FileDataModel(
      imagePath: AppImages.onYoshliKapitan,
      bookName: "O'n besh yoshli kapitan (roman)",
      fileUrl: "https://www.ziyouz.com/books/bolalar_kutubxonasi/Jyul%20Vern.%20O'n%20besh%20yoshli%20kapitan%20(roman).pdf",
      author: 'Jyul Vern', categoryId: 2,
    ),
    FileDataModel(
      imagePath: AppImages.jimjitlik,
      bookName: "Jimjitlik (roman)",
      fileUrl: "http://ferlibrary.uz/f/said_amad_zhimzhitlik_15.pdf",
      author: 'Said Ahmad', categoryId: 2,
    ),
    FileDataModel(
      imagePath: AppImages.yulduzli,
      bookName: "Yulduzli tunlar",
      fileUrl: "http://ferlibrary.uz/f/yulduzli_tunlar_15.pdf",
      author: 'Pirimqul Qodirov', categoryId: 2,
    ),
    FileDataModel(
      imagePath: AppImages.utgan,
      bookName: "O'tkan kunlar",
      fileUrl: "http://ferlibrary.uz/f/abdulla_qodiriy_otkan_kunlar_roman_15.pdf",
      author: 'Abdulla Qodiriy', categoryId: 2,
    ),
    FileDataModel(
      imagePath: AppImages.tarix,
      bookName: "O'zbekiston tarixi 10-sinf",
      fileUrl: "https://static.oliygoh.uz/uploads/4/ozbekiston_tarixi_10_uzb.pdf",
      author: 'Darslik', categoryId: 2,
    ),

  ];
}
