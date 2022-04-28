import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName='/catalog';

  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_)=> CatalogScreen());
  }
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}