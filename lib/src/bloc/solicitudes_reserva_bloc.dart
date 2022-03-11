

import 'package:capitan_flutter_web/src/Api/solicitudes_api.dart';
import 'package:capitan_flutter_web/src/models/solicitudes_model.dart';
import 'package:rxdart/rxdart.dart';

class SolicitudesRerservaBloc {
  final _solicitudesApi = SolicitudesApi();
 
  final _solitudPendienteController = BehaviorSubject<List<SolicitudesModel>>();
  final _solitudBusquedaController = BehaviorSubject<List<SolicitudesModel>>();
  final _cantidadSoliController = BehaviorSubject<int>();
  final _cargandoSolicitud = BehaviorSubject<bool>();
  final _cargandoBusquedaSolicitud = BehaviorSubject<bool>();
 
  Stream<List<SolicitudesModel>> get solicitudPendientesStream => _solitudPendienteController.stream;
  Stream<List<SolicitudesModel>> get solicitudBusquedaStream => _solitudBusquedaController.stream;
  Stream<bool> get cargandoSolicitudStream => _cargandoSolicitud.stream;

  Stream<bool> get cargandoBusquedaSolicitudStream => _cargandoBusquedaSolicitud.stream;

  Stream<int> get cantidadSolicitudesStream => _cantidadSoliController.stream;

  dispose() { 
    _cantidadSoliController.close();
    _solitudPendienteController.close();
    _cargandoSolicitud.close();
    _cargandoBusquedaSolicitud.close();
    _solitudBusquedaController.close();
  }

  void getSolicitudesPendientes() async {
    _cargandoSolicitud.sink.add(true);
    _solitudPendienteController.sink.add(await _solicitudesApi.obtenerSolicitudes());
    _cargandoSolicitud.sink.add(false);
  }

  void getBusquedaSolicitudes(String desde, String hasta, String tipo) async {
    _cargandoBusquedaSolicitud.sink.add(true);
    _solitudBusquedaController.sink.add(await _solicitudesApi.buscarSolicitudes(desde, hasta, tipo));
    _cargandoBusquedaSolicitud.sink.add(false);
  }
}
