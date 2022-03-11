import 'package:capitan_flutter_web/src/bloc/index_bloc.dart';
import 'package:capitan_flutter_web/src/pages/tabs/Inicio/inicio_general.dart';
import 'package:capitan_flutter_web/src/pages/tabs/Solicitudes/ver_solicitudes.dart';
import 'package:capitan_flutter_web/src/utils/responsive_builder.dart';
import 'package:capitan_flutter_web/src/widgets/head_navbar.dart';
import 'package:capitan_flutter_web/src/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          bool? value = false;

          return value;
        },
        child: Stack(
          children: const [
            ResponsiveBuilder(
              mobile: VistaTablet(),
              tablet: VistaTablet(),
              desktop: VistaTablet(),
            ),
          ],
        ),
      ),
    );
  }
}

class VistaTablet extends StatelessWidget {
  const VistaTablet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IndexBlocListener>(context, listen: false);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: provider.page,
          builder: (BuildContext context, EnumIndex data, Widget? child) {
            return Row(
              children: [
                Container(
                  color: Colors.white,
                  width: ScreenUtil().setWidth(230),
                  child: const NavBarHead(),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      const HeadNavbar(),
                      (data == EnumIndex.iinicio)
                      ? const Expanded(
                          child: InicioGeneral(),
                        )
                      : (data == EnumIndex.ibusquedaAvanzada)
                          ? const Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Center(child: Text('ibusquedaAvanzada')),
                              ),
                            )
                          : (data == EnumIndex.ggestionMenu)
                              ? Container()
                              : (data == EnumIndex.gicono)
                                  ? Container()
                                  : (data == EnumIndex.rgestionRoles)
                                      ? Container()
                                      : (data == EnumIndex.everTodas)
                                          ? Container()
                                          : (data == EnumIndex.sverSoli)
                                              ? const Expanded(child: VerSolicitudes())
                                              : (data == EnumIndex.sverTodas)
                                                  ? Container()
                                                  : (data == EnumIndex.sreporteReservas)
                                                      ? Container()
                                                      : (data == EnumIndex.vpendientesDeclarar)
                                                          ? Container()
                                                          : (data == EnumIndex.vHisVenDeclarar)
                                                              ? Container()
                                                              : (data == EnumIndex.vResumenDiario)
                                                                  ? Container()
                                                                  : (data == EnumIndex.vHisResumenDiario)
                                                                      ? Container()
                                                                      : (data == EnumIndex.vHisComu)
                                                                          ? Container()
                                                                          : Container()
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
