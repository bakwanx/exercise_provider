import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {

  int _counter = 0;
  int get getCounter => _counter;

  void increment(){
    _counter++;
    notifyListeners();
  }

}