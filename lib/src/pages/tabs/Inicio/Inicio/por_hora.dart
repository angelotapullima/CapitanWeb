
import 'package:capitan_flutter_web/src/bloc/canchas_disponibles_bloc.dart';
import 'package:capitan_flutter_web/src/bloc/provider_bloc.dart';
import 'package:capitan_flutter_web/src/models/cancha_disponibles_model.dart';
import 'package:capitan_flutter_web/src/pages/tabs/Inicio/Inicio/expansion_prueba.dart';
import 'package:capitan_flutter_web/src/utils/responsive.dart';
import 'package:capitan_flutter_web/src/widgets/WidgetCargandp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PorHoraPage extends StatefulWidget {
  const PorHoraPage({Key? key}) : super(key: key);

  @override
  _PorHoraPageState createState() => _PorHoraPageState();
}

class _PorHoraPageState extends State<PorHoraPage> {
  ScrollController controlleree = ScrollController();



  @override
  Widget build(BuildContext context) {
    
    final canchasDisponiblesBloc = ProviderBloc.canchasDisponibles(context);
    canchasDisponiblesBloc.obtenerCanchasDisponibles();
    return StreamBuilder(
            stream: canchasDisponiblesBloc.cargandoDisponiblesStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data) {
                  return _contenido(canchasDisponiblesBloc);
                } else {
                  return const Center(
                    child: CargandoWidget(),
                  );
                }
              } else {
                return const Center(
                  child: CargandoWidget(),
                );
              }
            },
          );
        }

  Widget _contenido(CanchasDisponiblesBloc canchasDisponiblesBloc) {
    return StreamBuilder(
      stream: canchasDisponiblesBloc.canchasDisponiblesStream,
      builder: (BuildContext context, AsyncSnapshot<List<CanchasDisponibles>> snapshot) {
        final responsive = Responsive.of(context);
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return ListView.builder(
              controller: controlleree,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics:const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ExpansionPrueba(
                  hora: "${snapshot.data![index].horaAtual}",
                  canchas: snapshot.data![index].canchasEmpresas!,
                  origenMetricaReserva: '2',
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return Center(
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: responsive.hp(1),
                      ),
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setWidth(350),
                      child: SvgPicture.asset('assets/svg/RESULTADOS.svg') //Image.asset('assets/logo_largo.svg'),
                      ),
                  MaterialButton(
                    color: Colors.green,
                    child:const Text(
                      'Cargar de Nuevo',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      canchasDisponiblesBloc.obtenerCanchasDisponibles();
                    },
                  )
                ],
              ),
            );
          }
        } else {
          return const Center(
            child: CargandoWidget(),
          );
        }
      },
    );
  }
}
