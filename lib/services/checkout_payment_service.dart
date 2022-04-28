import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../utils/utils.dart';
class CheckoutPaymentService{

  Future<void> initPaymentSheet(context, {required String email,required String street, required String city, required String cartId}) async {
    // 1. create payment intent on the server
    final response = await http.post(
        Uri.parse(
            'https://us-central1-ecommerce-app-3a8ae.cloudfunctions.net/stripePaymentIntentRequest'),
        body: {
          'street':street,
          'city': city,
          'email': email,
          'cartId': cartId,
        });


    final jsonResponse = jsonDecode(response.body);


    //2. initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: jsonResponse['paymentIntent'],
        merchantDisplayName: 'Flutter Stripe Store Demo',
        customerId: jsonResponse['customer'],
        customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
        testEnv: true,
        style: ThemeMode.light,
        merchantCountryCode: 'SG',
      ),
    );

    await Stripe.instance.presentPaymentSheet();

  }

}