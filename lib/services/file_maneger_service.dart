import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/files/file_data_model.dart';
import 'package:library_app/data/models/files/file_status_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileManagerService {
  static final FileManagerService instance = FileManagerService._();

  FileManagerService._() {
    _init();
  }

  factory FileManagerService() => instance;

  Directory? directory;

  _init() async {
    bool hasPermission = await requestWritePermission();
    if (!hasPermission) return;
    directory = await getDownloadPath();
  }

  static Future<bool> requestWritePermission() async {
    final info = await DeviceInfoPlugin().androidInfo;
    if (Platform.isAndroid && info.version.sdkInt > 29) {
      await Permission.manageExternalStorage.request();
    } else {
      await Permission.storage.request();
    }

    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }

  Future<FileStatusModel> checkFile(FileDataModel fileDataModel) async {
   // await _init();
    FileStatusModel fileStatusModel = FileStatusModel(
      isExist: false,
      newFileLocation: "",
    );
    //Check for url validation

    String savedLocation = '';

    List<String> pattern = fileDataModel.fileUrl.split(".");
    if (pattern.length > 1) {
      savedLocation =
      "${directory?.path}/${fileDataModel.bookName}.${pattern.last}";
    }
    fileStatusModel = fileStatusModel.copyWith(newFileLocation: savedLocation);

    var allFiles = directory?.list();

    List<String> filePaths = [];

    await allFiles?.forEach((element) {
      debugPrint("FILES IN DOWNLOAD FOLDER:${element.path}");
      filePaths.add(element.path.toString());
    });

    if (filePaths.contains(savedLocation)) {
      fileStatusModel = fileStatusModel.copyWith(isExist: true);
    }

    debugPrint(
        "FINAL FILE STATE:${fileStatusModel.newFileLocation} AND STAT:${fileStatusModel.isExist}");

    return fileStatusModel;
  }
}
