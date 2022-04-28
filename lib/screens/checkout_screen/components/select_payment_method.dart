import 'package:ecommerce_app/providers/select_payment/select_payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class SelectPaymentMethod extends StatefulWidget {

  SelectPaymentMethod({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(8),
      color: Colors.black.withAlpha(70),
      child:Column(
        children: [
          Text('SELECT A PAYMENT METHOD'),
          RadioListTile(
            value: PaymentSelection.visaCard,
            groupValue: context.watch<PaymentSelectionProvider>().selectedPayment,
            onChanged:context.read<PaymentSelectionProvider>().changeSelection,
            title: Text('Visa Card'),),

          RadioListTile(
            value: PaymentSelection.phoneNumber,
            groupValue: context.watch<PaymentSelectionProvider>().selectedPayment,
            onChanged:context.read<PaymentSelectionProvider>().changeSelection,
            title: Text('Phone Number'),)
        ],
      ),
    );
  }
}