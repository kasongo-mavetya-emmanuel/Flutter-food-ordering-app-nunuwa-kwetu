
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final categoriesRef= FirebaseFirestore.instance.collection('categories');
final productsRef= FirebaseFirestore.instance.collection('products');
final usersRef= FirebaseFirestore.instance.collection('users');
final kdarkTextColor=TextStyle(color: Colors.black,);
