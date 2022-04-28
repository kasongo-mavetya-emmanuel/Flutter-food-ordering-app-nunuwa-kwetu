import 'package:ecommerce_app/models/models.dart';

enum LoginStatus{
  initial,
  waiting,
  success,
  error,
}

class LoginState{
  LoginStatus loginStatus;
  CustomError error;

//<editor-fold desc="Data Methods">

  LoginState({
    required this.loginStatus,
    required this.error,
  });

  factory LoginState.initial(){
    return LoginState(loginStatus: LoginStatus.initial, error: CustomError(code: '', message: '', plugin: ''));
  }


  @override
  String toString() {
    return 'LoginState{' +
        ' loginStatus: $loginStatus,' +
        ' error: $error,' +
        '}';
  }

  LoginState copyWith({
    LoginStatus? loginStatus,
    CustomError? error,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      error: error ?? this.error,
    );
  }

//</editor-fold>
}