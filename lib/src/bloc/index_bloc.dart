import 'package:flutter/material.dart';

enum EnumIndex {
  iinicio,
  ibusquedaAvanzada,
  ggestionMenu,
  gicono,
  rgestionRoles,
  everTodas,
  sverSoli,
  sverTodas,
  sreporteReservas,
  vpendientesDeclarar,
  vHisVenDeclarar,
  vResumenDiario,
  vHisResumenDiario,
  vHisComu,
}

class IndexBlocListener with ChangeNotifier {
  final ValueNotifier<EnumIndex> _page = ValueNotifier(EnumIndex.sverSoli);
  ValueNotifier<EnumIndex> get page => _page;

  final ValueNotifier<bool> _cargandoEnvio = ValueNotifier(false);
  ValueNotifier<bool> get cargandoEnvio => _cargandoEnvio;

  IndexBlocListener() {
    _init();
  }
  void _init() {}

  //inicio
  void changeIIncio(BuildContext context) {
    _page.value = EnumIndex.iinicio;
    notifyListeners();
  }

  void changeToIbusquedaAvanzada(BuildContext context) {
    _page.value = EnumIndex.ibusquedaAvanzada;
    notifyListeners();
  }

  //Gestión de menu
  void changeToGgestionMenu() {
    _page.value = EnumIndex.ggestionMenu;
    notifyListeners();
  }

  void changeToGicono() {
    _page.value = EnumIndex.gicono;
    notifyListeners();
  }

  //Roles de Usuario
  void changeToRgestionRoles() {
    _page.value = EnumIndex.rgestionRoles;
    notifyListeners();
  }

  //Empresas
  void changeToEverTodass() {
    _page.value = EnumIndex.everTodas;
    notifyListeners();
  }

  //Solicitudes
  void changeToSverSoli() {
    _page.value = EnumIndex.sverSoli;
    notifyListeners();
  }

  void changeToSverTodas() {
    _page.value = EnumIndex.sverTodas;
    notifyListeners();
  }

  void changeToSreporteReservas() {
    _page.value = EnumIndex.sreporteReservas;
    notifyListeners();
  }

  //Ventas
  void changeToVVendientesDeclarar() {
    _page.value = EnumIndex.vpendientesDeclarar;
    notifyListeners();
  }

  void changeToVHisVenDeclarar() {
    _page.value = EnumIndex.vHisVenDeclarar;
    notifyListeners();
  }

  void changeToVResumenDiario() {
    _page.value = EnumIndex.vResumenDiario;
    notifyListeners();
  }

  void changeToVHisResumenDiario() {
    _page.value = EnumIndex.vHisResumenDiario;
    notifyListeners();
  }

  void changeToVHisComu() {
    _page.value = EnumIndex.vHisComu;
    notifyListeners();
  }

  void changeCargandoTrue() {
    _cargandoEnvio.value = true;
    notifyListeners();
  }

  void changeCargandoFalse() {
    _cargandoEnvio.value = false;
    notifyListeners();
  }
}
