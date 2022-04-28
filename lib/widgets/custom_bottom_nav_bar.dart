import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  int currentIndex;
  void Function(int) onTap ;
  CustomBottomNavBar({required this.currentIndex, required this.onTap, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined)),
        BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.add_shopping_cart_outlined)),
        BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline_sharp)),
      ],
    );
  }
}