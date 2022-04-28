import 'package:flutter/cupertino.dart';

enum PaymentSelection{
  visaCard,
  phoneNumber

}

class PaymentSelectionProvider with ChangeNotifier{
  PaymentSelection _selectedPayment= PaymentSelection.visaCard;
  PaymentSelection get selectedPayment=> _selectedPayment;

   void changeSelection(value){
    _selectedPayment= value;
    notifyListeners();
  }


}