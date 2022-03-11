import 'package:capitan_flutter_web/src/bloc/canchas_disponibles_bloc.dart';
import 'package:capitan_flutter_web/src/bloc/solicitudes_reserva_bloc.dart';
import 'package:flutter/material.dart';

//singleton para obtner una unica instancia del Bloc
class ProviderBloc extends InheritedWidget {
  final canchasDisponiblesBloc = CanchasDisponiblesBloc();
  final solicitudesRessrvasBloc = SolicitudesRerservaBloc();

  ProviderBloc({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CanchasDisponiblesBloc canchasDisponibles(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!.canchasDisponiblesBloc;
  }

  //PARA LISTAR SOLICITUDES DE RESERVA
  static SolicitudesRerservaBloc solicitudesReserva(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!.solicitudesRessrvasBloc;
  }
}
