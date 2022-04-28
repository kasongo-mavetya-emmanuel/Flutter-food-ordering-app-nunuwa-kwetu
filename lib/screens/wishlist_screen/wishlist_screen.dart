import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName='/wishlist';

  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_)=> WishListScreen());
  }
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}