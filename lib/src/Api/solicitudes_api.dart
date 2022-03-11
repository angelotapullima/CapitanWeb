import 'dart:convert';
import 'package:capitan_flutter_web/src/models/solicitudes_model.dart';
import 'package:capitan_flutter_web/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class SolicitudesApi { 
  Future<List<SolicitudesModel>> obtenerSolicitudes() async {
    try {
      final List<SolicitudesModel> listResult = [];
      final url = Uri.parse('$apiBaseURL/api/Solicitud/listar_solicitudes_pendientes');

      final resp = await http.post(url, body: {
        'app': 'true',
        'tn': tokenWeb,
        'id_ubigeo': '1',
      });

      final decodedData = json.decode(resp.body);

      if (decodedData["code"] == 1) {
        if (decodedData.length > 0) {
          for (var i = 0; i < decodedData["data"].length; i++) {
            SolicitudesModel solicitudesmodel = SolicitudesModel();
            solicitudesmodel.idSolicitud = decodedData["data"][i]['id_solicitud'];
            solicitudesmodel.idUsuario = decodedData["data"][i]['id_usuario'];
            solicitudesmodel.idCancha = decodedData["data"][i]['id_cancha'];
            solicitudesmodel.solicitudTipo = decodedData["data"][i]['solicitud_tipo'];
            solicitudesmodel.solicitudCodigoApp = decodedData["data"][i]['solicitud_codigo_app'];
            solicitudesmodel.solicitudNombre = decodedData["data"][i]['solicitud_nombre'];
            solicitudesmodel.solicitudFecha = decodedData["data"][i]['solicitud_fecha'];
            solicitudesmodel.solicitudHora = decodedData["data"][i]['solicitud_hora'];
            solicitudesmodel.solicitudTelefono = decodedData["data"][i]['solicitud_telefono'];
            solicitudesmodel.solicitudCodigo = decodedData["data"][i]['solicitud_codigo'];
            solicitudesmodel.solicitudPago = decodedData["data"][i]['solicitud_pago'];
            solicitudesmodel.solicitudComision = decodedData["data"][i]['solicitud_comision'];
            solicitudesmodel.solicitudPagoDatetime = decodedData["data"][i]['solicitud_pago_datetime'];
            solicitudesmodel.solicitudEstado = decodedData["data"][i]['solicitud_estado'];
            solicitudesmodel.solicitudPagado = decodedData["data"][i]['solicitud_pagado'];
            solicitudesmodel.solicitudObservaciones = decodedData["data"][i]['solicitud_observaciones'];
            solicitudesmodel.solicitudFile = decodedData["data"][i]['solicitud_file'];
            solicitudesmodel.solicitudOrigen = decodedData["data"][i]['solicitud_origen'];
            solicitudesmodel.solicitudVentatipo = decodedData["data"][i]['solicitud_ventatipo'];
            solicitudesmodel.solicitudVentanrodoc = decodedData["data"][i]['solicitud_ventanrodoc'];
            solicitudesmodel.solicitudRazonsocial = decodedData["data"][i]['solicitud_razonsocial'];
            solicitudesmodel.solicitudDomicilio = decodedData["data"][i]['solicitud_domicilio'];
            solicitudesmodel.solicitudAprobacionDate = decodedData["data"][i]['id_usuario_aprobacion'];
            solicitudesmodel.solicitudAprobacionDate = decodedData["data"][i]['solicitud_aprobacion_date'];
            solicitudesmodel.solicitudMt = decodedData["data"][i]['solicitud_mt'];
            solicitudesmodel.canchaId = decodedData["data"][i]['cancha_id'];
            solicitudesmodel.empresaId = decodedData["data"][i]['empresa_id'];
            solicitudesmodel.canchaNombre = decodedData["data"][i]['cancha_nombre'];
            solicitudesmodel.canchaDimensiones = decodedData["data"][i]['cancha_dimensiones'];
            solicitudesmodel.canchaPrecioM = decodedData["data"][i]['cancha_precioM'];
            solicitudesmodel.canchaPrecioD = decodedData["data"][i]['cancha_precioD'];
            solicitudesmodel.canchaPrecioN = decodedData["data"][i]['cancha_precioN'];
            solicitudesmodel.canchaDeporte = decodedData["data"][i]['cancha_deporte'];
            solicitudesmodel.canchaTipo = decodedData["data"][i]['cancha_tipo'];
            solicitudesmodel.canchaFoto = decodedData["data"][i]['cancha_foto'];
            solicitudesmodel.canchaPromoPrecio = decodedData["data"][i]['cancha_promo_precio'];
            solicitudesmodel.canchaPromoInicio = decodedData["data"][i]['cancha_promo_inicio'];
            solicitudesmodel.canchaPromoFin = decodedData["data"][i]['cancha_promo_fin'];
            solicitudesmodel.canchaPromoEstado = decodedData["data"][i]['cancha_promo_estado'];
            solicitudesmodel.canchaComision = decodedData["data"][i]['cancha_comision'];
            solicitudesmodel.canchaEstado = decodedData["data"][i]['cancha_estado'];
            solicitudesmodel.usuarioId = decodedData["data"][i]['usuario_id'];
            solicitudesmodel.ubigeoId = decodedData["data"][i]['ubigeo_id'];
            solicitudesmodel.empresaNombre = decodedData["data"][i]['empresa_nombre'];
            solicitudesmodel.empresaDireccion = decodedData["data"][i]['empresa_direccion'];
            solicitudesmodel.empresaCoordX = decodedData["data"][i]['empresa_coord_x'];
            solicitudesmodel.empresaCoordY = decodedData["data"][i]['empresa_coord_y'];
            solicitudesmodel.empresaTelefono1 = decodedData["data"][i]['empresa_telefono_1'];
            solicitudesmodel.empresaTelefono2 = decodedData["data"][i]['empresa_telefono_2'];
            solicitudesmodel.empresaDescripcion = decodedData["data"][i]['empresa_descripcion'];
            solicitudesmodel.empresaHorarioLs = decodedData["data"][i]['empresa_horario_ls'];
            solicitudesmodel.empresaHorarioD = decodedData["data"][i]['empresa_horario_d'];
            solicitudesmodel.empresaValoracion = decodedData["data"][i]['empresa_valoracion'];
            solicitudesmodel.empresaFoto = decodedData["data"][i]['empresa_foto'];
            listResult.add(solicitudesmodel);
          }
        }
      }

      return listResult;
    } catch (error, stacktrace) {
      final List<SolicitudesModel> listResult = [];
      print("Exception occured: $error stackTrace: $stacktrace");
      return listResult;
    }
  }

  Future<List<SolicitudesModel>> buscarSolicitudes(String desde, String hasta, String tipo) async {
    try {
      final List<SolicitudesModel> listResult = [];
      final url = Uri.parse('$apiBaseURL/api/Solicitud/listar_soli_por_fechas_app');

      final resp = await http.post(url, body: {
        'app': 'true',
        'tn': tokenWeb,
        'desde': desde,
        'hasta': hasta,
        'tipo': tipo,
      });

      final decodedData = json.decode(resp.body);
      print(decodedData);

      if (decodedData.length > 0) {
        for (var i = 0; i < decodedData.length; i++) {
          SolicitudesModel solicitudesmodel = SolicitudesModel();
          solicitudesmodel.idSolicitud = decodedData[i]['id_solicitud'];
          solicitudesmodel.idUsuario = decodedData[i]['id_usuario'];
          solicitudesmodel.idCancha = decodedData[i]['id_cancha'];
          solicitudesmodel.solicitudTipo = decodedData[i]['solicitud_tipo'];
          solicitudesmodel.solicitudCodigoApp = decodedData[i]['solicitud_codigo_app'];
          solicitudesmodel.solicitudNombre = decodedData[i]['solicitud_nombre'];
          solicitudesmodel.solicitudFecha = decodedData[i]['solicitud_fecha'];
          solicitudesmodel.solicitudHora = decodedData[i]['solicitud_hora'];
          solicitudesmodel.solicitudTelefono = decodedData[i]['solicitud_telefono'];
          solicitudesmodel.solicitudCodigo = decodedData[i]['solicitud_codigo'];
          solicitudesmodel.solicitudPago = decodedData[i]['solicitud_pago'];
          solicitudesmodel.solicitudComision = decodedData[i]['solicitud_comision'];
          solicitudesmodel.solicitudPagoDatetime = decodedData[i]['solicitud_pago_datetime'];
          solicitudesmodel.solicitudEstado = decodedData[i]['solicitud_estado'];
          print(solicitudesmodel.solicitudEstado);
          solicitudesmodel.solicitudPagado = decodedData[i]['solicitud_pagado'];
          solicitudesmodel.solicitudObservaciones = decodedData[i]['solicitud_observaciones'];
          solicitudesmodel.solicitudFile = decodedData[i]['solicitud_file'];
          solicitudesmodel.solicitudOrigen = decodedData[i]['solicitud_origen'];
          solicitudesmodel.solicitudVentatipo = decodedData[i]['solicitud_ventatipo'];
          solicitudesmodel.solicitudVentanrodoc = decodedData[i]['solicitud_ventanrodoc'];
          solicitudesmodel.solicitudRazonsocial = decodedData[i]['solicitud_razonsocial'];
          solicitudesmodel.solicitudDomicilio = decodedData[i]['solicitud_domicilio'];
          solicitudesmodel.solicitudAprobacionDate = decodedData[i]['id_usuario_aprobacion'];
          solicitudesmodel.solicitudAprobacionDate = decodedData[i]['solicitud_aprobacion_date'];
          solicitudesmodel.solicitudMt = decodedData[i]['solicitud_mt'];
          solicitudesmodel.canchaId = decodedData[i]['cancha_id'];
          solicitudesmodel.empresaId = decodedData[i]['empresa_id'];
          solicitudesmodel.canchaNombre = decodedData[i]['cancha_nombre'];
          solicitudesmodel.canchaDimensiones = decodedData[i]['cancha_dimensiones'];
          solicitudesmodel.canchaPrecioM = decodedData[i]['cancha_precioM'];
          solicitudesmodel.canchaPrecioD = decodedData[i]['cancha_precioD'];
          solicitudesmodel.canchaPrecioN = decodedData[i]['cancha_precioN'];
          solicitudesmodel.canchaDeporte = decodedData[i]['cancha_deporte'];
          solicitudesmodel.canchaTipo = decodedData[i]['cancha_tipo'];
          solicitudesmodel.canchaFoto = decodedData[i]['cancha_foto'];
          solicitudesmodel.canchaPromoPrecio = decodedData[i]['cancha_promo_precio'];
          solicitudesmodel.canchaPromoInicio = decodedData[i]['cancha_promo_inicio'];
          solicitudesmodel.canchaPromoFin = decodedData[i]['cancha_promo_fin'];
          solicitudesmodel.canchaPromoEstado = decodedData[i]['cancha_promo_estado'];
          solicitudesmodel.canchaComision = decodedData[i]['cancha_comision'];
          solicitudesmodel.canchaEstado = decodedData[i]['cancha_estado'];
          solicitudesmodel.usuarioId = decodedData[i]['usuario_id'];
          solicitudesmodel.ubigeoId = decodedData[i]['ubigeo_id'];
          solicitudesmodel.empresaNombre = decodedData[i]['empresa_nombre'];
          solicitudesmodel.empresaDireccion = decodedData[i]['empresa_direccion'];
          solicitudesmodel.empresaCoordX = decodedData[i]['empresa_coord_x'];
          solicitudesmodel.empresaCoordY = decodedData[i]['empresa_coord_y'];
          solicitudesmodel.empresaTelefono1 = decodedData[i]['empresa_telefono_1'];
          solicitudesmodel.empresaTelefono2 = decodedData[i]['empresa_telefono_2'];
          solicitudesmodel.empresaDescripcion = decodedData[i]['empresa_descripcion'];
          solicitudesmodel.empresaHorarioLs = decodedData[i]['empresa_horario_ls'];
          solicitudesmodel.empresaHorarioD = decodedData[i]['empresa_horario_d'];
          solicitudesmodel.empresaValoracion = decodedData[i]['empresa_valoracion'];
          solicitudesmodel.empresaFoto = decodedData[i]['empresa_foto'];
          listResult.add(solicitudesmodel);
        }
      }

      return listResult;
    } catch (error, stacktrace) {
      final List<SolicitudesModel> listResult = [];
      print("Exception occured: $error stackTrace: $stacktrace");
      return listResult;
    }
  }

  Future<int> cambiarEstadoSolicitud(String idSolicitud, String estado) async {
    try {
      final url = Uri.parse('$apiBaseURL/api/Solicitud/aprobar_solicitud');

      final resp = await http.post(url, body: {
        'app': 'true',
        'tn': tokenWeb,
        'id_solicitud': idSolicitud,
        'ind': estado,
      });

      final decodedData = json.decode(resp.body);

      return decodedData;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return 0;
    }
  }

  Future<int> editarSolicitud(String idSolicitud, String idCancha, String fecha, String hora, String pago) async {
    try {
      final url = Uri.parse('$apiBaseURL/api/Empresa/editar_solicitud');

      final resp = await http.post(url, body: {
        'app': 'true',
        'tn':tokenWeb,
        'id_solicitud': idSolicitud,
        'id_cancha': idCancha,
        'fecha': fecha,
        'hora': hora,
        'pago1': pago,
      });

      final decodedData = json.decode(resp.body);
      print(decodedData);

      return decodedData['code'];

      //return decodedData;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return 0;
    }
  }
}
