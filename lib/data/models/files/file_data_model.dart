class FileDataModel {
  final String author;
  final String bookName;
  final String fileUrl;
  final String imagePath;
  final int categoryId;

  FileDataModel({required this.author,
    required this.categoryId,
    required this.imagePath,
    required this.bookName,
    required this.fileUrl,
  });
}
