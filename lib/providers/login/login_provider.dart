
import 'package:ecommerce_app/models/custom_error.dart';
import 'package:ecommerce_app/providers/login/login_state.dart';
import 'package:ecommerce_app/services/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{
  LoginState _state= LoginState.initial();
  LoginState get state=> _state;

  AuthRepository authRepository;
  LoginProvider({
    required this.authRepository,
  });

  Future<void> googleLogin()async{

    try{
      _state=_state.copyWith(loginStatus: LoginStatus.waiting);
      notifyListeners();
      await authRepository.loginUserWithGoogle();
      _state=_state.copyWith(loginStatus: LoginStatus.success);
      notifyListeners();
    }on CustomError catch(e){
      _state=_state.copyWith(loginStatus: LoginStatus.error, error:e );
      print('dddddddddddddddddddddd${e.message}');
      rethrow;
    }
  }

}