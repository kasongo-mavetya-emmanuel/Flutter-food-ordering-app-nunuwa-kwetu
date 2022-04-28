import 'package:flutter/material.dart';
class AppTheme{

  ThemeData buildTheme(){
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey[100],
      textTheme: ThemeData.dark().textTheme,
      appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ) ,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
     primaryColor: Colors.black,
     //canvasColor: Colors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        // selectedIconTheme: IconThemeData(
        //   color: Colors.white,
        // ),
        // unselectedIconTheme:IconThemeData(
        //   color: Colors.grey[300],
        // ),
      ),
    );
  }
}