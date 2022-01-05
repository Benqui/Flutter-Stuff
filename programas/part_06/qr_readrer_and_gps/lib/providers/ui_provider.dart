import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectMenuOpt = 0;

  int get selectedMenuOpt {
    return this._selectMenuOpt;
  }

  set selectedMenuOpt(int i) {
    this._selectMenuOpt = i;
    notifyListeners();
  }
}
