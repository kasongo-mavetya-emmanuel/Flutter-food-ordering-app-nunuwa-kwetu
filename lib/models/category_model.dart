

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String name;
  final String imgUrl;

  const CategoryModel({
    required this.name,
    required this.imgUrl,
  });

  factory CategoryModel.fromDoc(DocumentSnapshot doc){
    final categData= doc.data() as Map;
    return CategoryModel(name: categData['name'], imgUrl: categData['imageUrl']);
  }
}