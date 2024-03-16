import 'package:flutter/material.dart';

class BookModel {
  BookModel({
    required this.description,
    required this.bookName,
    required this.imageUrl,
    required this.price,
    required this.categoryId,
    required this.uuid,
    required this.rate,
    required this.author,
  });

  final String bookName;
  final String author;
  final double rate;
  final double price;
  final String description;
  final int categoryId;
  final String imageUrl;
  final String uuid;

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      bookName: json["book_name"] as String? ?? "",
      description: json["description"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
      price: (json["price"] as num? ?? 0.0).toDouble(),
      uuid: json["_uuid"] as String? ?? "",
      categoryId: json["category_id"] as int? ?? 0,
      rate: json["rate"] as double? ?? 0.0,
      author: json["author"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "book_name": bookName,
      "price": price,
      "description": description,
      "rate": rate,
      "image_url": imageUrl,
      "author": author,
      "category_id": categoryId,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "book_name": bookName,
      "price": price,
      "description": description,
      "rate": rate,
      "image_url": imageUrl,
      "_uuid": uuid,
    };
  }

  static BookModel initialValue = BookModel(
      description: "",
      price: 0.0,
      imageUrl: "",
      uuid: "", 
      bookName: "",
      categoryId: 0,
      rate: 0.0,
      author: "",
      );


  BookModel copyWith({
    String? bookName,
    String? author,
    String? description,
    int? categoryId,
    String? imageUrl,
    double? price,
    double? rate,
    String? uuid,

  }) {
    return BookModel(
        bookName: bookName ?? this.bookName,
        author: author ?? this.author,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        price: price ?? this.price,
        rate: rate ?? this.rate,
        categoryId: categoryId ?? this.categoryId,
        uuid: uuid ?? this.uuid,
    );
  }

  bool canAddModel() {
    if (bookName.isEmpty) return false;
    if (author.isEmpty) return false;
    if (description.isEmpty) return false;
    if (imageUrl.isEmpty) return false;
    if (price == 0) return false;
    if (categoryId == 0) return false;
    return true;
  }

}

//categorie 1-siyosat, 2-fantastika,  3-fan, 4-biografiya