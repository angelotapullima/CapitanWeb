import 'package:flutter/material.dart';

class ControllerCalculo extends ChangeNotifier {
  bool expanded1 = false, expanded2 = false, expanded3 = false, expanded4 = false, expanded5 = false, expanded6 = false;

  void changeExpanded(bool e, int lugar) {
    if (lugar == 1) {
      if (e) {
        expanded1 = e;
        expanded2 = false;
        expanded3 = false;
        expanded4 = false;
        expanded5 = false;
        expanded6 = false;
      } else {
        expanded1 = e;
      }
    } else if (lugar == 2) {
      if (e) {
        expanded1 = false;
        expanded2 = e;
        expanded3 = false;
        expanded4 = false;
        expanded5 = false;
        expanded6 = false;
      } else {
        expanded2 = e;
      }
    } else if (lugar == 3) {
      if (e) {
        expanded1 = false;
        expanded2 = false;
        expanded3 = e;
        expanded4 = false;
        expanded5 = false;
        expanded6 = false;
      } else {
        expanded3 = e;
      }
    } else if (lugar == 4) {
      if (e) {
        expanded1 = false;
        expanded2 = false;
        expanded3 = false;
        expanded4 = e;
        expanded5 = false;
        expanded6 = false;
      } else {
        expanded4 = e;
      }
    } else if (lugar == 5) {
       if (e) {
        expanded1 = false;
        expanded2 = false;
        expanded3 = false;
        expanded4 = false;
        expanded5 = e;
        expanded6 = false;
      } else {
        expanded5 = e;
      }
    } else if (lugar == 6) {
      if (e) {
        expanded1 = false;
        expanded2 = false;
        expanded3 = false;
        expanded4 = false;
        expanded5 = false;
        expanded6 = e;
      } else {
        expanded6 = e;
      }
    }

    notifyListeners();
  }
}
