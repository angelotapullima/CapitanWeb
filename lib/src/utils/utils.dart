

import 'package:capitan_flutter_web/src/models/negocios_model.dart';
import 'package:capitan_flutter_web/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;

import 'package:intl/intl.dart';

String obtenerFechaString(String date) {
  final datex = date.split(' ');
  final fechita = datex[0].trim();

  return fechita;
}

void showToast2(String texto, Color color) {
  Fluttertoast.showToast(msg: "$texto", toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 3, backgroundColor: color, textColor: Colors.white);
}
String format(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 2 : 2);
}

bool validarAperturaDeNegocio(NegociosModelResult negocio) {
  var now =   DateTime.now();
  var horaActual = now.hour;

  if (now.weekday == 7) {
    final horaSinFormato = negocio.horarioD!.split('-');
    final hApertura = formatHora(horaSinFormato[0].trim());
    final hCierre = formatHora(horaSinFormato[1].trim());
    //horario de domingo
    if (horaActual >= hApertura && horaActual < hCierre) {
      return true;
    } else {
      return false;
    }
  } else {
    //horario de lunes a sabado
    final horaSinFormato = negocio.horarioLs!.split('-');
    final hApertura = formatHora(horaSinFormato[0].trim());
    final hCierre = formatHora(horaSinFormato[1].trim());

    if (horaActual >= hApertura && horaActual < hCierre) {
      return true;
    } else {
      return false;
    }
  }
}
String horaBusqueda(String hora) {
  final horex = hora.split('-');
  final hApertura = horex[0].trim().trim();

  return hApertura;
}

String separadorHora(String hora) {
  final horex = hora.split('-');
  final hApertura = horex[0].trim().trim();
  final hCierre = horex[1].trim();

  return '$hApertura - $hCierre';
}

int formatHora(String dato) {
  final horaSinFormato = dato.split(':');
  final horaA = horaSinFormato[0];
  return int.parse(horaA.trim());
}


int obtenerHoraInicio(String fecha, String p) {
  final horario = fecha.split(p);
  final hApertura = formatHora(horario[0].trim());
  return hApertura;
}

void showdialogSaldo(BuildContext context, Responsive responsive) async {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (_) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        contentPadding:const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        content: SizedBox(
          width: responsive.wp(90),
          height: responsive.hp(40),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: responsive.hp(8),
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/svg/check.svg',
                  ),
                ),
              const  Text(
                  "Usted no cuenta con saldo suficiente para reservar una cancha, por favor recargue su cuenta de bufis para continuar",
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    color: Color(0xFF5B6978),
                  ),
                ),
                SizedBox(
                  height: responsive.hp(3),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: responsive.wp(33),
                      height: responsive.hp(5),
                      child: MaterialButton(
                        color: Colors.red,
                        child: const Text('Atras', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: responsive.wp(33),
                      height: responsive.hp(5),
                      child: MaterialButton(
                        color: Colors.green,
                        child:const  Text('Recargar', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.pushNamed(context, 'solicitarRecarga');
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showdialogEquipos(BuildContext context, Responsive responsive) async {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (_) {
      return AlertDialog(
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        contentPadding:  const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        content: SizedBox(
          width: responsive.wp(90),
          height: responsive.hp(35),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: responsive.hp(8),
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/svg/check.svg',
                  ),
                ),
                const Text(
                  "Usted no tiene equipos registrados, por favor registre uno para continuar con la reserva",
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    color: Color(0xFF5B6978),
                  ),
                ),
                SizedBox(
                  height: responsive.hp(3),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: responsive.wp(33),
                      height: responsive.hp(5),
                      child: MaterialButton(
                        color: Colors.red,
                        child:const Text('Atras', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: responsive.wp(33),
                      height: responsive.hp(5),
                      child: MaterialButton(
                        color: Colors.green,
                        child:const Text('Crear Equipo', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.pushNamed(context, 'registroEquipos');
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

/* 

void seleccionarJugador(
    BuildContext context, UsuarioModel usuario, String dato) async {
  final jugadoresBloc = ProviderBloc.jugadores(context);
  final jugadoresTemporalesDatabase = JugadoresTemporalesDatabase();
  final usuarioDatabase = UsuarioDatabase();

  if (usuario.usuarioSeleccionado == '1') {
    await jugadoresTemporalesDatabase
        .deleteJugadorTemporalPorId(usuario.usuarioId);
    await usuarioDatabase.updateEstadoSeleccionUsuario(usuario.usuarioId, '0');
  } else {
    await jugadoresTemporalesDatabase.insertarJugadoresTemporales(usuario);
    await usuarioDatabase.updateEstadoSeleccionUsuario(usuario.usuarioId, '1');
  }

  jugadoresBloc.obtenerJugadoresGeneral();
  jugadoresBloc.obtenerJugadoresGeneralesDatoDatabase(dato);
  jugadoresBloc.obtenerJugadoresTenporales();
}
 */

String obtenerMesPorNumero(int number) {
  switch (number) {
    case 1:
      return 'Enero';
    case 2:
      return 'Febrero';
    case 3:
      return 'Marzo';
    case 4:
      return 'Abril';
    case 5:
      return 'Mayo';
    case 6:
      return 'Junio';
    case 7:
      return 'Julio';
    case 8:
      return 'Agosto';
    case 9:
      return 'Setiembre';
    case 10:
      return 'Octubre';
    case 11:
      return 'Noviembre';
    case 12:
      return 'Diciembre';

    default:
  }

  return '';
}

String transformarHoraA12Horas(String dato) {
  var datoI = '';
  var datoF = '';
  var inifor = '';
  var finfor = '';

  final horasSeparadas = dato.split('-');
  final horaInicio = horasSeparadas[0].trim();
  final horaFinal = horasSeparadas[1].trim();

  final horiInicialRecortada = horaInicio.toString().split(':');
  final horai = horiInicialRecortada[0].trim();

  final horiFinalRecortada = horaFinal.toString().split(':');
  final horaf = horiFinalRecortada[0].trim();

  if (int.parse(horai) == 12) {
    datoI = horai;
    inifor = 'pm';
  } else if (int.parse(horai) > 12) {
    datoI = (int.parse(horai) - 12).toString();
    inifor = 'pm';
  } else {
    datoI = horai;
    inifor = 'am';
  }

  if (int.parse(horaf) == 12) {
    datoF = horaf;
    finfor = 'pm';
  } else if (int.parse(horaf) > 12) {
    datoF = (int.parse(horaf) - 12).toString();
    finfor = 'pm';
  } else {
    datoF = horaf;
    finfor = 'am';
  }

  return '$datoI:00 $inifor - $datoF:00 $finfor';
}

obtenerFecha(String date) {
  if (date == 'null' || date == '') {
    return '';
  }

  var fecha = DateTime.parse(date);

  final DateFormat fech =   DateFormat('dd MMM yyyy', 'es');

  return fech.format(fecha);
}

obtenerFecha2(String date) {
  if (date == 'null' || date == '') {
    return '';
  }

  var fecha = DateTime.parse(date);

  final DateFormat fech =   DateFormat('dd / MM / yyyy', 'es');

  return fech.format(fecha);
}

obtenerRangoFechaSemanal(String dateInicio, String dateFin) {
  if ((dateInicio == 'null' || dateInicio == '') && (dateFin == 'null' || dateFin == '')) {
    return '';
  }

  var fecha1 = DateTime.parse(dateInicio);
  var fecha2 = DateTime.parse(dateFin);

  final DateFormat dia =   DateFormat('dd', 'es');
  final DateFormat mes =   DateFormat('MMMM', 'es');
  //final DateFormat year = new DateFormat('yyyy', 'es');

  var mes1 = mes.format(fecha1);
  var mes2 = mes.format(fecha2);

  if (mes1 == mes2) {
    return 'del ${dia.format(fecha1)} al ${dia.format(fecha2)} de $mes1';
  } else {
    return 'del ${dia.format(fecha1)} $mes1 al ${dia.format(fecha2)} $mes2';
  }
}

obtenerHora(String date) {
  if (date == 'null' || date == '') {
    return '';
  }
  var fecha = DateTime.parse(date);

  //final DateFormat fech = new DateFormat('Hms', 'es');

  String valor = DateFormat.jms().format(fecha);

  return valor;
}

obtenerDiaMes(String date) {
  if (date == 'null' || date == '') {
    return '';
  }

  var fecha = DateTime.parse(date);

  final DateFormat fech =   DateFormat('dd MMM', 'es');

  return fech.format(fecha);
}

obtenerFechaReservas(String date) {
  if (date == 'null' || date == '') {
    return '';
  }

  var fecha = DateTime.parse(date);

  final DateFormat fech =   DateFormat('yyyy-MM-dd', 'es');

  return fech.format(fecha);
}

obtenerEdad(String date) {
  if (date == 'null') {
    return '';
  } else {
    DateTime dob = DateTime.parse(date);
    Duration dur = DateTime.now().difference(dob);
    String differenceInYears = (dur.inDays / 365).floor().toString();
    return differenceInYears;
  }
}

verificarNull(var data) {
  if (data != null) {
    return data.toString();
  } else {
    return '';
  }
}

maxLines(String text, double ancho, TextStyle style) {
  final span = TextSpan(
    text: text,
    style: style,
  );
  final tp = TextPainter(text: span, textDirection: ui.TextDirection.ltr);
  tp.layout(maxWidth: ancho);
  return tp.computeLineMetrics().length;
}

obtenerEmail(String email) {
  if (email != '') {
    var separarEmail = email.split('@');
    var primeraLetra = separarEmail[0].split('');
    return '${primeraLetra[0]}*****@${separarEmail[1]}';
  } else {
    return '';
  }
}

obtenerPrimerNombre(String nombre) {
  if (nombre != '') {
    var separarNombre = nombre.split(' ');
    return separarNombre[0];
  } else {
    return '';
  }
}

Widget closeNode(FocusNode node) {
  return GestureDetector(
    onTap: () => node.unfocus(),
    child: Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: const Text(
        "Cerrar",
      ),
    ),
  );
}

List<DateTime> getDateList(DateTime firstDate, DateTime lastDate) {
  List<DateTime> list = [];
  int count = daysCount(toDateMonthYear(firstDate), toDateMonthYear(lastDate));
  for (int i = 0; i < count; i++) {
    list.add(toDateMonthYear(firstDate).add(Duration(days: i)));
  }
  return list;
}

DateTime toDateMonthYear(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

int daysCount(DateTime first, DateTime last) => last.difference(first).inDays + 1;

enum LabelType {
  date,
  month,
  weekday,
}
