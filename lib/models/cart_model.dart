import 'package:cloud_firestore/cloud_firestore.dart';

class CartProductModel{
  String? name;
  String? category;
  String? id;
  int quantity;
  String? image;
  double? price;

  CartProductModel({
     this.name,
     this.category,
     this.id,
     this.quantity=1,
    this.image,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'category': this.category,
      'quantity': this.quantity,
      'image': this.image,
      'price': this.price,
    };
  }

  factory CartProductModel.fromDoc(DocumentSnapshot doc) {
    final cartProdData= doc.data() as Map;
    return CartProductModel(
      name: cartProdData['name'] as String,
      category: cartProdData['category'] as String,
      id: doc.id as String,
      quantity: cartProdData['quantity'] as int,
      image: cartProdData['image'] as String,
      price: cartProdData['price'] as double,
    );
  }
}