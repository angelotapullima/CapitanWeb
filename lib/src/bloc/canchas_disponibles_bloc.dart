

import 'package:capitan_flutter_web/src/Api/canchas_disponibles_api.dart';
import 'package:capitan_flutter_web/src/models/cancha_disponibles_model.dart';
import 'package:capitan_flutter_web/src/models/negocios_model.dart';
import 'package:rxdart/rxdart.dart';

class CanchasDisponiblesBloc {
  final canchasDisponiblesApi = CanchasDisponiblesApi();

  final _canchasDisponiblesController = BehaviorSubject<List<CanchasDisponibles>>();
  final _canchasDisponiblesFechasController = BehaviorSubject<List<CanchasDisponibles>>();
  final _canchasDisponiblesHorasController = BehaviorSubject<List<NegociosModelResult>>();
  final _cargandoDisponiblesController = BehaviorSubject<bool>();
  final _cargandoDisponiblesAvanzadoController = BehaviorSubject<bool>();

  Stream<List<CanchasDisponibles>> get canchasDisponiblesStream => _canchasDisponiblesController.stream;
  Stream<List<CanchasDisponibles>> get canchasDisponiblesFechasStreams => _canchasDisponiblesFechasController.stream;
  Stream<List<NegociosModelResult>> get canchasDisponiblesHorasStream => _canchasDisponiblesHorasController.stream;
  Stream<bool> get cargandoDisponiblesStream => _cargandoDisponiblesController.stream;
  Stream<bool> get cargandoDisponiblesAvanzadoStream => _cargandoDisponiblesAvanzadoController.stream;

  dispose() {
    _canchasDisponiblesController.close();
    _canchasDisponiblesFechasController.close();
    _canchasDisponiblesHorasController.close();
    _cargandoDisponiblesController.close();
    _cargandoDisponiblesAvanzadoController.close();
  }

  void obtenerCanchasDisponibles() async {
    _cargandoDisponiblesController.sink.add(false);
    _canchasDisponiblesController.sink.add(await canchasDisponiblesApi.obtenerCanchasDisponibles());
    _cargandoDisponiblesController.sink.add(true);
  }

  void obtenerCanchasDisponiblesFechass(String hora, String fecha, String negocio, String tipo, String deporte) async {
    _cargandoDisponiblesAvanzadoController.sink.add(true);

    _canchasDisponiblesFechasController.sink.add(await canchasDisponiblesApi.obtenerFechasDisponibles(hora, fecha, negocio, tipo, deporte));

    _cargandoDisponiblesAvanzadoController.sink.add(false);
  }

  void obtenerCanchasDisponiblesHoras(String hora, String fecha, String negocio, String tipo, String deporte) async {
    //_cargandoDisponiblesController.sink.add(false);
    _cargandoDisponiblesAvanzadoController.sink.add(true);

    _canchasDisponiblesHorasController.sink.add(await canchasDisponiblesApi.obtenerHorasDisponibles(hora, fecha, negocio, tipo, deporte));
    _cargandoDisponiblesAvanzadoController.sink.add(false);

    //_cargandoDisponiblesController.sink.add(true);
  }

  void cargandoFalse() async {
    _cargandoDisponiblesController.sink.add(false);
  }
}
