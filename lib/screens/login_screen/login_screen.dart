import 'package:ecommerce_app/models/custom_error.dart';
import 'package:ecommerce_app/providers/login/login_provider.dart';
import 'package:ecommerce_app/providers/login/login_state.dart';
import 'package:ecommerce_app/screens/landing_screen/landing_screen.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName='/login';
  static Route route(){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
        builder: (_)=>LoginScreen());
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _login()async{
    try{
      await context.read<LoginProvider>().googleLogin();
    }on CustomError catch(e){
       print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    LoginState state= context.watch<LoginProvider>().state;
    if(state.loginStatus==LoginStatus.success){
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, LandingScreen.routeName);
      });
    }
    if(state.loginStatus==LoginStatus.error){
      return Container();
    }
    return Scaffold(
      appBar: CustomAppBar(title: 'Login',),
      body: Center(
        child: OutlinedButton(
          onPressed: state.loginStatus==LoginStatus.waiting?null:_login,
          child: Text( state.loginStatus==LoginStatus.waiting?'Submitting':'Google SignIn'),
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
          ),
        ),
      ),
    );
  }
}
