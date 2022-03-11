import 'package:flutter/material.dart';

class SolicitudBloc with ChangeNotifier {
  final ValueNotifier<bool> _cargando = ValueNotifier(false);
  ValueNotifier<bool> get cargando => _cargando;



  void changeCargandoTrue() {
    _cargando.value = true;
    notifyListeners();
  }

  void changeCargandoFalse() {
    _cargando.value = false;
    notifyListeners();
  }
}
