
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  final String id;
  final String name;
  final String category;
  final List images;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.images,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  factory ProductModel.fromDoc(DocumentSnapshot doc){
    final prodData= doc.data() as Map;
    return ProductModel(
        id: doc.id,
        name: prodData['name'],
        category: prodData['category'].toString(),
        images: List<String>.from(prodData['images']),
        price: prodData['price'].toDouble(),
        isRecommended: prodData['isRecommended'],
        isPopular: prodData['isPopular']);
  }



}