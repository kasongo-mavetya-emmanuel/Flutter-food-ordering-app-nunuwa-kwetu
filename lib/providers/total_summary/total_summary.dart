
import 'package:flutter/cupertino.dart';

class TotalSummary extends ChangeNotifier{

  double? _total=0;
  double _subtotal=0;

  double get total{
    _total= _subtotal+deliveryFee;
    print('ooooooooooooo$_total');
    return _total!;}

  double get subtotal{
    print('eeeeeeeee$_subtotal');
    return _subtotal;}

  double get deliveryFee{
    if(_subtotal <=30.0){
      return 0.0;
    }
    else{
      return 5.0;
    }
  }

}