import 'package:ecommerce_app/screens/checkout_screen/components/components.dart';
import 'package:ecommerce_app/services/checkout_payment_service.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';



class CheckoutScreen extends StatefulWidget {
  static const String routeName='/checkout';
   CheckoutScreen({Key? key}) : super(key: key);

   static Route route(){
     return MaterialPageRoute(
         settings: RouteSettings(name: routeName),
       builder: (BuildContext context) {
           return CheckoutScreen();
       },
     );
   }

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController addressController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  final _formKey= GlobalKey<FormState>();
  bool isbottomSheet=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'CHECKOUT',),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Text('CUSTOMER INFORMATION', style: TextStyle(color: Colors.black),),
            Text(context.read<User>().email.toString(),style: TextStyle(color: Colors.black)),
            Divider(),
            Text('DELIVERY INFORMATION'),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: addressTextForm(),
           ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: cityTextForm(),
            ),
            SelectPaymentMethod(),
            Text('ORDER SUMMARY'),
            TotalDetails(),
          ],
        ),
      ),
      bottomSheet:Container(
        color: Colors.black,
        height: 70,
        width: double.infinity,
        child: Center(
          child: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            onPressed: _initPayment,
            child: Text('Pay Now'),
          ),
        ),
      ),
    );
  }

  void _initPayment()async{
      final form= _formKey.currentState;
      if(form==null || !form.validate())return;
      try {
        await CheckoutPaymentService().initPaymentSheet(context, email: context.read<User>().email!, cartId: context.read<User>().uid, street: addressController.text, city: cityController.text,);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment completed!')),
        );

      }on StripeException catch(e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e}'),
          ),
        );
      }

  }

  Widget addressTextForm(){
    return TextFormField(
      controller: addressController,
      style: TextStyle(color: Colors.black),
      validator: (String? val){
        if(val!.isEmpty){
          return 'required';
        }
      },
      decoration: InputDecoration(
        label: Text('Enter Street'),
        hintText: 'Street',
        hoverColor: Colors.black,
        focusColor: Colors.black,
      ),
    );
  }

  Widget cityTextForm(){
    return TextFormField(
      style: TextStyle(color: Colors.black),
      controller: cityController,
        validator: (String? value){
      if(value!.isEmpty|| value.trim().isEmpty){
        return 'required';
      }},
      decoration: InputDecoration(
        label: Text('Enter City'),
        hintText: 'City',
        hoverColor: Colors.black,
        focusColor: Colors.black,
      ),
    );
  }
}


