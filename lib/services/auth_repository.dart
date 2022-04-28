import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/models.dart';

class AuthRepository{
  FirebaseAuth auth;
  AuthRepository({
    required this.auth,
  });

  Stream<User?> get user=> auth.userChanges();

  Future loginUserWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      UserCredential _authResult = await auth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo!.isNewUser) {
        UserModel _user = UserModel(
          uid: _authResult.user!.uid.toString(),
          email: _authResult.user!.email.toString(),
          fullName: _authResult.user!.displayName.toString(),
          accountCreated: Timestamp.now().toString(),
        );
        await usersRef.doc(_user.uid).set(_user.toMap());
      }
    }on FirebaseAuthException catch(e){
       throw CustomError(code: e.code, message: e.message.toString(), plugin: e.plugin);
    }catch(e){
      throw CustomError(code: 'Exception', message: e.toString(), plugin: 'Exception/plugin');

    }
  }


}