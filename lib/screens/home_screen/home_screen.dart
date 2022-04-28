
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'components/components.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName='/home';

  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_)=> HomeScreen());
  }
  HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: 'NuNuWa KweTu',),
      body: SafeArea(
        child: ListView(
          children: [
            CategoriesCarousel(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 190,
                child: RecommendedStreamBuilder()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 190,
                child: PopularStreamBuilder()),
          ],
        ),
      ),
    );
  }
}








