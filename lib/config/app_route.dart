import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter{

  static Route onGenerateRoute(RouteSettings settings){
    print(settings.name);
    switch(settings.name){
      case'/':
        return LandingScreen.route();
      case LandingScreen.routeName:
        return LandingScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(productModel: settings.arguments as ProductModel);
      case WishListScreen.routeName:
        return WishListScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case CategoryProductsScreen.routeName:
        return CategoryProductsScreen.route(category: settings.arguments as String);
      case CheckoutScreen.routeName:
         return CheckoutScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_)=> Scaffold(

        ));
  }
}