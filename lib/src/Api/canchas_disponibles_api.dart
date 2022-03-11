import 'dart:convert';

import 'package:capitan_flutter_web/src/models/cancha_disponibles_model.dart';
import 'package:capitan_flutter_web/src/models/negocios_model.dart';
import 'package:capitan_flutter_web/src/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class CanchasDisponiblesApi {
  Future<List<CanchasDisponibles>> obtenerCanchasDisponibles() async {
    try {
      final url = Uri.parse('$apiBaseURL/api/Empresa/listar_canchas_libres_por_hora');
      final List<CanchasDisponibles> listGeneral = [];

      final resp = await http.post(
        url,
        body: {'app': 'true', 'tn': tokenWeb},
      );
      final decodedData = json.decode(resp.body);

      int hora;
      String fecha;

      var horaServidor = decodedData['fecha_actual'];
      horaServidor = horaServidor.split(' ');
      fecha = horaServidor[0].trim();
      hora = formatHora(horaServidor[1].trim());

      hora++;

      String horaActual = '';
      /* if (hora > 9) { */
      horaActual = hora.toString();
      /* } else {
        horaActual = '0$hora';
      } */
      var date = DateTime.now();
      var week = date.weekday;
      var horarioCancha;

      if (decodedData['results'].length > 0) {
        for (int i = 0; i < decodedData['results'].length; i++) {
          CanchasDisponibles listGen = CanchasDisponibles();

          final List<CanchasDisponiblesConEmpresas> listEmpresas = [];

          for (int x = 0; x < decodedData['results'][i][horaActual].length; x++) {
            final idEmpresaaaurio = decodedData['results'][i][horaActual][x]['id'];
            if (decodedData['results'][i][horaActual][x][idEmpresaaaurio].length > 0) {
              //final empresaDatos = await negociosDatabase.obtenerNegocioPorId(idEmpresaaaurio);
              var canchitasLoop = decodedData['results'][i][horaActual][x][idEmpresaaaurio];
              CanchasDisponiblesConEmpresas canchasDisponiblesConEmpresas = CanchasDisponiblesConEmpresas();
              canchasDisponiblesConEmpresas.idEmpresa = idEmpresaaaurio;
              canchasDisponiblesConEmpresas.nombreEmpresa = canchitasLoop[0]['empresa_nombre'].toString();
              canchasDisponiblesConEmpresas.direccion = canchitasLoop[0]['empresa_direccion'].toString();

              final List<CanchasDisponiblesResult> list = [];
              for (var y = 0; y < canchitasLoop.length; y++) {
                if (week == 7) {
                  horarioCancha = canchitasLoop[y]['empresa_horario_d'].toString();
                } else {
                  horarioCancha = canchitasLoop[y]['empresa_horario_ls'].toString();
                }

                var horarioApertura = horarioCancha.split('-');
                horarioApertura = horarioApertura[0];
                horarioApertura = formatHora(horarioApertura);

                var horarioCierre = horarioCancha.split('-');
                horarioCierre = horarioCierre[1];
                horarioCierre = formatHora(horarioCierre);

                if (hora >= horarioApertura && hora < horarioCierre) {
                  CanchasDisponiblesResult canchas = CanchasDisponiblesResult();

                  /*  if (hora >= 17) {
                    canchas.canchaPrecioFinal = canchitasLoop[y]['cancha_precioN'];
                  } else {
                    canchas.canchaPrecioFinal = canchitasLoop[y]['cancha_precioD'];
                  } */
                  canchas.empresaId = canchitasLoop[y]['empresa_id'];
                  canchas.usuarioId = canchitasLoop[y]['usuario_id'];
                  canchas.ubigeoId = canchitasLoop[y]['ubigeo_id'];
                  canchas.empresaNombre = canchitasLoop[y]['empresa_nombre'];
                  canchas.empresaDireccion = canchitasLoop[y]['empresa_direccion'];
                  canchas.empresaCoordX = canchitasLoop[y]['empresa_coord_x'];
                  canchas.empresaCoordY = canchitasLoop[y]['empresa_coord_y'];
                  canchas.empresaTelefono1 = canchitasLoop[y]['empresa_telefono_1'];
                  canchas.empresaTelefono2 = canchitasLoop[y]['empresa_telefono_2'];
                  canchas.empresaDescripcion = canchitasLoop[y]['empresa_descripcion'];
                  canchas.empresaHorarioLs = canchitasLoop[y]['empresa_horario_ls'];
                  canchas.empresaHorarioD = canchitasLoop[y]['empresa_horario_d'];
                  canchas.empresaValoracion = canchitasLoop[y]['empresa_valoracion'];
                  canchas.empresaFoto = canchitasLoop[y]['empresa_foto'];
                  canchas.empresaEstado = canchitasLoop[y]['empresa_estado'];
                  canchas.empresaFact = canchitasLoop[y]['empresa_fact'];
                  canchas.canchaNombre = canchitasLoop[y]['cancha_nombre'];
                  canchas.deporteTipo = canchitasLoop[y]['cancha_deporte'];
                  canchas.deporte = canchitasLoop[y]['cancha_deporte_nombre'];
                  canchas.tipoNombre = canchitasLoop[y]['cancha_tipo_nombre'];
                  canchas.tipo = canchitasLoop[y]['cancha_tipo'];
                  canchas.canchaId = canchitasLoop[y]['cancha_id'];
                  canchas.canchaPrecioD = canchitasLoop[y]['cancha_precioD'];
                  canchas.canchaPrecioN = canchitasLoop[y]['cancha_precioN'];
                  canchas.canchaPromoPrecio = canchitasLoop[y]['cancha_promo_precio'];
                  canchas.canchaPromoInicio = canchitasLoop[y]['cancha_promo_inicio'];
                  canchas.canchaPromoFin = canchitasLoop[y]['cancha_promo_fin'];
                  canchas.canchaPromoEstado = canchitasLoop[y]['cancha_promo_estado'];
                  canchas.fechaActual = decodedData['fecha_actual'];
                  canchas.soyAdmin = canchitasLoop[y]['soy_admin'];
                  canchas.canchaFoto = canchitasLoop[y]['cancha_foto'];
                  canchas.comisionCancha = canchitasLoop[y]['cancha_comision'];

                

                  String precioOficial;
                  String precio;

                  if (hora > 17) {
                    precio = canchitasLoop[y]['cancha_precioN'];
                  } else {
                    precio = canchitasLoop[y]['cancha_precioD'];
                  }

                  String promoEstado = canchitasLoop[y]['cancha_promo_estado'];
                  String promoInicio = canchitasLoop[y]['cancha_promo_inicio'];
                  String promoFin = canchitasLoop[y]['cancha_promo_fin'];
                  String promoPrecio = canchitasLoop[y]['cancha_promo_precio'];

                  if (promoEstado == '0') {
                    precioOficial = precio;
                  } else {
                    String horaParse;
                    if (hora > 9) {
                      horaParse = hora.toString();
                    } else {
                      horaParse = '0$hora';
                    }

                    DateTime fechaInicioPromo = DateTime.parse(promoInicio);
                    fechaInicioPromo.add(
                      new Duration(days: 1),
                    );
                    DateTime fechaFinPromo = DateTime.parse(promoFin);
                    fechaFinPromo.add(
                      new Duration(days: 1),
                    );

                    DateTime fechaActualEnDate = DateTime.parse('$fecha $horaParse:01:00');

                    fechaActualEnDate.toIso8601String();

                    if (fechaActualEnDate.isAfter(fechaInicioPromo)) {
                      if (fechaActualEnDate.isBefore(fechaFinPromo)) {
                        precioOficial = promoPrecio;
                      } else {
                        precioOficial = precio;
                      }
                    } else {
                      precioOficial = precio;
                    }
                  }

                  canchas.canchaPrecioFinal = precioOficial;
                  list.add(canchas);
                }
              }

              canchasDisponiblesConEmpresas.canchasList = list;
              if (list.length > 0) {
                listEmpresas.add(canchasDisponiblesConEmpresas);
              }
            }
          }

          String horaFormateada;
          if (hora > 8) {
            if (hora > 11) {
              horaFormateada = '$hora:00 pm - ${hora + 1}:00 pm';
            } else {
              if (hora < 11) {
                horaFormateada = '$hora:00 am - ${hora + 1}:00 am';
              } else {
                horaFormateada = '$hora:00 am - ${hora + 1}:00 pm';
              }
            }
          } else {
            horaFormateada = '0$hora:00 am -  0${hora + 1}:00 am';
          }

          listGen.horaAtual = horaFormateada;
          listGen.fecha = fecha;
          listGen.canchasEmpresas = listEmpresas;
          listGeneral.add(listGen);

          hora++;

          horaActual = hora.toString();
        }
        return listGeneral;
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return [];
    }
  }

  Future<List<CanchasDisponibles>> obtenerFechasDisponibles(String horacio, String fecha, String negocio, String tipo, String deporte) async {
    try {
      

      final url = Uri.parse('$apiBaseURL/api/Empresa/busqueda_avanzada');
      final List<CanchasDisponibles> listGeneral = [];

      final resp = await http.post(
        url,
        body: {
          'app': 'true',
          'tn': tokenWeb,
          'hora': horacio,
          'fecha': fecha,
          'negocio': negocio,
          'tipo': tipo,
          'deporte': deporte,
        },
      );
      final decodedData = json.decode(resp.body);
      int hora = decodedData['inicio'];
      String horaActual = hora.toString();

      if (hora > 9) {
        horaActual = hora.toString();
      } else {
        horaActual = '$hora';
      }

      if (decodedData['results'].length > 0) {
        for (int i = 0; i < decodedData['results'].length; i++) {
          CanchasDisponibles listGen = CanchasDisponibles();

          var empresaLoop = decodedData['results'][i][horaActual];
          final List<CanchasDisponiblesConEmpresas> listEmpresasConCanchas = [];
          for (int x = 0; x < empresaLoop.length; x++) {
            final idEmpresaaaurio = decodedData['results'][i][horaActual][x]['id'];
            var canchitasLoop = decodedData['results'][i][horaActual][x][idEmpresaaaurio];

            CanchasDisponiblesConEmpresas canchasDisponiblesConEmpresas = CanchasDisponiblesConEmpresas();
            canchasDisponiblesConEmpresas.idEmpresa = idEmpresaaaurio;

            canchasDisponiblesConEmpresas.nombreEmpresa = canchitasLoop[0]['empresa_nombre'];

            final List<CanchasDisponiblesResult> list = [];
            for (var y = 0; y < canchitasLoop.length; y++) {
              CanchasDisponiblesResult canchas = CanchasDisponiblesResult();
              canchas.empresaId = canchitasLoop[y]['empresa_id'];
              canchas.usuarioId = canchitasLoop[y]['usuario_id'];
              canchas.ubigeoId = canchitasLoop[y]['ubigeo_id'];
              canchas.empresaNombre = canchitasLoop[y]['empresa_nombre'];
              canchas.empresaDireccion = canchitasLoop[y]['empresa_direccion'];
              canchas.empresaCoordX = canchitasLoop[y]['empresa_coord_x'];
              canchas.empresaCoordY = canchitasLoop[y]['empresa_coord_y'];
              canchas.empresaTelefono1 = canchitasLoop[y]['empresa_telefono_1'];
              canchas.empresaTelefono2 = canchitasLoop[y]['empresa_telefono_2'];
              canchas.empresaDescripcion = canchitasLoop[y]['empresa_descripcion'];
              canchas.empresaHorarioLs = canchitasLoop[y]['empresa_horario_ls'];
              canchas.empresaHorarioD = canchitasLoop[y]['empresa_horario_d'];
              canchas.empresaValoracion = canchitasLoop[y]['empresa_valoracion'];
              canchas.empresaFoto = canchitasLoop[y]['empresa_foto'];
              canchas.empresaEstado = canchitasLoop[y]['empresa_estado'];
              canchas.canchaId = canchitasLoop[y]['cancha_id'];
              canchas.canchaPrecioD = canchitasLoop[y]['cancha_precioD'];
              canchas.canchaPrecioN = canchitasLoop[y]['cancha_precioN'];
              canchas.canchaPromoPrecio = canchitasLoop[y]['cancha_promo_precio'];
              canchas.canchaPromoInicio = canchitasLoop[y]['cancha_promo_inicio'];
              canchas.canchaPromoFin = canchitasLoop[y]['cancha_promo_fin'];
              canchas.canchaPromoEstado = canchitasLoop[y]['cancha_promo_estado'];
              canchas.deporteTipo = canchitasLoop[y]['cancha_deporte'];
              canchas.deporte = canchitasLoop[y]['cancha_deporte_nombre'];
              canchas.tipo = canchitasLoop[y]['cancha_tipo'];
              canchas.tipoNombre = canchitasLoop[y]['cancha_tipo_nombre'];
              canchas.fechaActual = decodedData['fecha_actual'];
              canchas.canchaNombre = canchitasLoop[y]['cancha_nombre'];
              canchas.canchaFoto = canchitasLoop[y]['cancha_foto'];
              canchas.soyAdmin = canchitasLoop[y]['soy_admin'];

              String precioOficial;
              String precio;

              if (hora > 17) {
                precio = canchitasLoop[y]['cancha_precioN'];
              } else {
                precio = canchitasLoop[y]['cancha_precioD'];
              }

              String promoEstado = canchitasLoop[y]['cancha_promo_estado'];
              String promoInicio = canchitasLoop[y]['cancha_promo_inicio'];
              String promoFin = canchitasLoop[y]['cancha_promo_fin'];
              String promoPrecio = canchitasLoop[y]['cancha_promo_precio'];

              if (promoEstado == '0') {
                precioOficial = precio;
              } else {
                String horaParse;
                if (hora > 9) {
                  horaParse = hora.toString();
                } else {
                  horaParse = '0$hora';
                }

                DateTime fechaInicioPromo = DateTime.parse(promoInicio);
                fechaInicioPromo.add(new Duration(days: 1));
                DateTime fechaFinPromo = DateTime.parse(promoFin);
                fechaFinPromo.add(new Duration(days: 1));

                DateTime fechaActualEnDate = DateTime.parse('$fecha $horaParse:01:00');

                fechaActualEnDate.toIso8601String();

                if (fechaActualEnDate.isAfter(fechaInicioPromo)) {
                  if (fechaActualEnDate.isBefore(fechaFinPromo)) {
                    precioOficial = promoPrecio;
                  } else {
                    precioOficial = precio;
                  }
                } else {
                  precioOficial = precio;
                }
              }

              canchas.canchaPrecioFinal = precioOficial;

              list.add(canchas);
            }

            canchasDisponiblesConEmpresas.canchasList = list;

            listEmpresasConCanchas.add(canchasDisponiblesConEmpresas);
          }
          String horaFormateada;
          if (hora > 8) {
            if (hora > 11) {
              horaFormateada = '$hora:00 pm - ${hora + 1}:00 pm';
            } else {
              if (hora < 11) {
                horaFormateada = '$hora:00 am - ${hora + 1}:00 am';
              } else {
                horaFormateada = '$hora:00 am - ${hora + 1}:00 pm';
              }
            }
          } else {
            horaFormateada = '0$hora:00 am - 0${hora + 1}:00 am';
          }

          listGen.horaAtual = horaFormateada;
          listGen.fecha = fecha;
          listGen.canchasEmpresas = listEmpresasConCanchas;
          listGeneral.add(listGen);
          hora++;
          horaActual = hora.toString();
        }
        return listGeneral;
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return [];
    }
  }

  Future<List<NegociosModelResult>> obtenerHorasDisponibles(String horacio, String fecha, String negocio, String tipo, String deporte) async {
    try {
     
      if (horacio != 'Todos') {
        horacio = formatHora(horacio).toString();
      }

      final url = Uri.parse('$apiBaseURL/api/Empresa/busqueda_avanzada');

      final resp = await http.post(url, body: {
        'app': 'true',
        'tn': tokenWeb,
        'hora': horacio,
        'fecha': fecha,
        'negocio': negocio,
        'tipo': tipo,
        'deporte': deporte,
      });
      final decodedData = json.decode(resp.body);

      final List<NegociosModelResult> listaGeneral = [];
      final List<String> listaIdNegocio = [];

      if (decodedData['results'].length > 0) {
        for (var j = 0; j < decodedData['results'].length; j++) {
          listaIdNegocio.add(decodedData['results'][j]['empresa_id']);
        }
        final algo = listaIdNegocio.toSet().toList();
        for (var x = 0; x < algo.length; x++) {
          //final negociosDatabase = NegociosDatabase();

          //final empres = await negociosDatabase.obtenerNegocioPorId(algo[x]);
          final List<CanchasDisponiblesResult> list = [];

          NegociosModelResult negociosModelResult = NegociosModelResult();

          negociosModelResult.idEmpresa = algo[x];
          //negociosModelResult.nombre = (empres.length > 0) ? empres[0].nombre : '';

          for (int i = 0; i < decodedData['results'].length; i++) {
            var emprex = decodedData['results'][i]['empresa_id'];
            if (algo[x] == emprex) {
              CanchasDisponiblesResult canchas = CanchasDisponiblesResult();
              canchas.empresaId = decodedData['results'][i]['empresa_id'];
              canchas.usuarioId = decodedData['results'][i]['usuario_id'];
              canchas.ubigeoId = decodedData['results'][i]['ubigeo_id'];
              canchas.empresaNombre = decodedData['results'][i]['empresa_nombre'];
              canchas.empresaDireccion = decodedData['results'][i]['empresa_direccion'];
              canchas.empresaCoordX = decodedData['results'][i]['empresa_coord_x'];
              canchas.empresaCoordY = decodedData['results'][i]['empresa_coord_y'];
              canchas.empresaTelefono1 = decodedData['results'][i]['empresa_telefono_1'];
              canchas.empresaTelefono2 = decodedData['results'][i]['empresa_telefono_2'];
              canchas.empresaDescripcion = decodedData['results'][i]['empresa_descripcion'];
              canchas.empresaHorarioLs = decodedData['results'][i]['empresa_horario_ls'];
              canchas.empresaHorarioD = decodedData['results'][i]['empresa_horario_d'];
              canchas.empresaValoracion = decodedData['results'][i]['empresa_valoracion'];
              canchas.empresaFoto = decodedData['results'][i]['empresa_foto'];
              canchas.empresaEstado = decodedData['results'][i]['empresa_estado'];
              canchas.canchaId = decodedData['results'][i]['cancha_id'];
              canchas.tipo = decodedData['results'][i]['cancha_tipo'];
              canchas.tipoNombre = decodedData['results'][i]['cancha_tipo_nombre'];
              canchas.deporteTipo = decodedData['results'][i]['cancha_deporte'];
              canchas.deporte = decodedData['results'][i]['cancha_deporte_nombre'];
              canchas.canchaPrecioD = decodedData['results'][i]['cancha_precioD'];
              canchas.canchaPrecioN = decodedData['results'][i]['cancha_precioN'];
              canchas.canchaPromoPrecio = decodedData['results'][i]['cancha_promo_precio'];
              canchas.canchaPromoInicio = decodedData['results'][i]['cancha_promo_inicio'];
              canchas.canchaPromoFin = decodedData['results'][i]['cancha_promo_fin'];
              canchas.canchaPromoEstado = decodedData['results'][i]['cancha_promo_estado'];
              canchas.fechaActual = decodedData['fecha_actual'];
              canchas.canchaNombre = decodedData['results'][i]['cancha_nombre'];
              canchas.soyAdmin = decodedData['results'][i]['soy_admin'];
              canchas.canchaFoto = decodedData['results'][i]['cancha_foto'];

              String precioOficial;
              String precio;

              if (int.parse(horacio) > 17) {
                precio = decodedData['results'][i]['cancha_precioN'];
              } else {
                precio = decodedData['results'][i]['cancha_precioD'];
              }

              String promoEstado = canchas.canchaPromoEstado.toString();
              String promoInicio = canchas.canchaPromoInicio.toString();
              String promoFin = canchas.canchaPromoFin.toString();
              String promoPrecio = canchas.canchaPromoPrecio.toString();

              if (promoEstado == '0') {
                precioOficial = precio;
              } else {
                String horaParse;
                if (int.parse(horacio) > 9) {
                  horaParse = int.parse(horacio).toString();
                } else {
                  horaParse = '0$int.parse(horacio)';
                }

                DateTime fechaInicioPromo = DateTime.parse(promoInicio);
                fechaInicioPromo.add(new Duration(days: 1));
                DateTime fechaFinPromo = DateTime.parse(promoFin);
                fechaFinPromo.add(new Duration(days: 1));

                DateTime fechaActualEnDate = DateTime.parse('$fecha $horaParse:01:00');

                fechaActualEnDate.toIso8601String();

                if (fechaActualEnDate.isAfter(fechaInicioPromo)) {
                  if (fechaActualEnDate.isBefore(fechaFinPromo)) {
                    precioOficial = promoPrecio;
                  } else {
                    precioOficial = precio;
                  }
                } else {
                  precioOficial = precio;
                }
              }

              canchas.canchaPrecioFinal = precioOficial;
              var horaInicio = int.parse(horacio);
              var horaFin = horaInicio + 1;

              String horaInicioFinal;
              String horaFinFinal;

              if (horaInicio > 8) {
                if (horaInicio > 11) {
                  horaInicioFinal = '$horaInicio:00 pm';
                } else {
                  horaInicioFinal = '$horaInicio:00 am';
                }
              } else {
                horaInicioFinal = '0$horaInicio:00 am';
              }

              if (horaFin > 8) {
                if (horaFin > 11) {
                  horaFinFinal = '$horaFin:00 pm';
                } else {
                  horaFinFinal = '$horaFin:00 am';
                }
              } else {
                horaFinFinal = '0$horaFin:00 am';
              }
              var dd = '$horaInicioFinal  - $horaFinFinal';

              canchas.canchaHoraCancha = dd;
              list.add(canchas);
            }
          }

          negociosModelResult.canchasList = list;
          listaGeneral.add(negociosModelResult);
        }

        return listaGeneral;
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return [];
    }
  }
}
