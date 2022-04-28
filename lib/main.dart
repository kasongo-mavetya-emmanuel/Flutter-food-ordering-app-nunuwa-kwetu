import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/config/app_route.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/providers/login/login_provider.dart';
import 'package:ecommerce_app/providers/select_payment/select_payment_provider.dart';
import 'package:ecommerce_app/services/auth_repository.dart';
import 'package:ecommerce_app/services/cart_repository.dart';
import 'package:ecommerce_app/services/product_repository.dart';
import 'package:ecommerce_app/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
  "pk_test_51KsPWMEhILCB56ngYInbQBd0RXWlbwbbGt7hvo8bLvHy7Fqzu9wn8ZfhmHXkg5GXRIg0r0JSmsSc0nfBjRvnAqWc00E6XPA1Qd";
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductRepository>(create: (context)=> ProductRepository(),),
        Provider<CartRepository>(create: (context)=> CartRepository(firebaseFirestore: FirebaseFirestore.instance),),
        Provider<AuthRepository>(create: (context)=> AuthRepository(auth: FirebaseAuth.instance),),
        StreamProvider<User?>(create: (context)=> context.read<AuthRepository>().user, initialData: null),
        ChangeNotifierProvider<LoginProvider>(create: (context)=> LoginProvider(authRepository: context.read<AuthRepository>())),
        ChangeNotifierProvider<PaymentSelectionProvider>(create: (context)=> PaymentSelectionProvider(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme().buildTheme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: LandingScreen.routeName,
      ),
    );
  }
}











