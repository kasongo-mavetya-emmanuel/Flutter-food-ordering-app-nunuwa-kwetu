import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class LandingScreen extends StatefulWidget {
  static const String routeName='/';

  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_)=> LandingScreen());
  }
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  List<Widget> _pages=[
    HomeScreen(),
    CartScreen(),
    Scaffold()
  ];

  int _currentIndex=0;

  _onTap(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: _currentIndex, onTap: _onTap,),
      body: _pages[_currentIndex],
    );
  }
}