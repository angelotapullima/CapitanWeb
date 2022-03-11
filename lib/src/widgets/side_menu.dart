import 'package:capitan_flutter_web/src/bloc/calculator_bloc.dart';
import 'package:capitan_flutter_web/src/bloc/index_bloc.dart';
import 'package:capitan_flutter_web/src/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NavBarHead extends StatefulWidget {
  const NavBarHead({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBarHead> createState() => _NavBarHeadState();
}

class _NavBarHeadState extends State<NavBarHead> {
  final ControllerCalculo _controller = ControllerCalculo();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IndexBlocListener>(context, listen: false);
    return ValueListenableBuilder(
        valueListenable: provider.page,
        builder: (BuildContext context, EnumIndex data, Widget? child) {
          return Row(
            children: [
          Expanded(
            child: AnimatedBuilder(
                animation: _controller,
                builder: (_, c) {
                  return Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(50),
                      ),
                      Container(
                        height: ScreenUtil().setHeight(50),
                        decoration: const BoxDecoration(),
                        child: SvgPicture.asset(
                          'assets/svg/LOGO_CAPITAN.svg',
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: ScreenUtil().setHeight(30),
                              ),
                              SideMenuItem(
                                controller: _controller,
                                title: 'Inicio',
                                expanded: _controller.expanded1,
                                position: 1,
                                heightExpanded: ScreenUtil().setHeight(55) + ScreenUtil().setHeight(150),
                                aseetUrl: 'assets/svg/home.svg',
                                content: SizedBox(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Opciones :',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: ScreenUtil().setHeight(5)),
                                        InkWell(
                                          onTap: (){
                                            provider.changeIIncio(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: ScreenUtil().setHeight(12),
                                                bottom: ScreenUtil().setHeight(12),
                                                left: ScreenUtil().setWidth(10)),
                                            child: Text(
                                              'Inicio',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            provider.changeToIbusquedaAvanzada(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: ScreenUtil().setHeight(12),
                                                bottom: ScreenUtil().setHeight(12),
                                                left: ScreenUtil().setWidth(10)),
                                            child: const Text(
                                              'Busqueda Avanzada',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(20),
                              ),
                              SideMenuItem(
                                controller: _controller,
                                title: 'Gestión de Menú',
                                expanded: _controller.expanded2,
                                position: 2,
                                heightExpanded: ScreenUtil().setHeight(55) + ScreenUtil().setHeight(150),
                                aseetUrl: 'assets/svg/home.svg',
                                content: SizedBox(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Opciones :',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: ScreenUtil().setHeight(5)),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(12),
                                              bottom: ScreenUtil().setHeight(12),
                                              left: ScreenUtil().setWidth(10)),
                                          child: Text(
                                            'Gestionar Menús',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(15),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(12),
                                              bottom: ScreenUtil().setHeight(12),
                                              left: ScreenUtil().setWidth(10)),
                                          child: const Text(
                                            'Iconos',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              /*  _expandedContainer(
                                'Inicio',
                                _controller.expanded1,
                                SizedBox(
                                  child: Column(
                                    children: const [
                                      Text('khberfhrfg'),
                                      Text('khberfhrfg'),
                                      Text('khberfhrfg'),
                                      Text('khberfhrfg'),
                                      Text('khberfhrfg'),
                                      Text('khberfhrfg'),
                                    ],
                                  ),
                                ),
                                1),
                            */
                              SizedBox(
                                height: ScreenUtil().setHeight(20),
                              ),
                              SideMenuItem(
                                controller: _controller,
                                title: 'Roles de Usuario',
                                expanded: _controller.expanded3,
                                position: 3,
                                heightExpanded: ScreenUtil().setHeight(55) + ScreenUtil().setHeight(100),
                                aseetUrl: 'assets/svg/home.svg',
                                content: SizedBox(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Opciones :',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: ScreenUtil().setHeight(5)),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(12),
                                              bottom: ScreenUtil().setHeight(12),
                                              left: ScreenUtil().setWidth(10)),
                                          child: Text(
                                            'Gestionar Roles',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(15),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(20),
                              ),
                              SideMenuItem(
                                controller: _controller,
                                title: 'Empresas',
                                expanded: _controller.expanded4,
                                position: 4,
                                heightExpanded: ScreenUtil().setHeight(55) + ScreenUtil().setHeight(100),
                                aseetUrl: 'assets/svg/home.svg',
                                content: SizedBox(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Opciones :',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: ScreenUtil().setHeight(5)),
                                        Container(
                                          padding: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(12),
                                            bottom: ScreenUtil().setHeight(12),
                                            left: ScreenUtil().setWidth(10),
                                          ),
                                          child: Text(
                                            'Ver Todas',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(15),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(20),
                              ),
                              SideMenuItem(
                                controller: _controller,
                                title: 'Solicitudes',
                                expanded: _controller.expanded5,
                                position: 5,
                                heightExpanded: ScreenUtil().setHeight(55) + ScreenUtil().setHeight(205),
                                aseetUrl: 'assets/svg/home.svg',
                                content: SizedBox(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Opciones :',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: ScreenUtil().setHeight(5)),
                                        InkWell(
                                          onTap: () {

                                            provider.changeToSverSoli();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(12),
                                              bottom: ScreenUtil().setHeight(12),
                                              left: ScreenUtil().setWidth(10),
                                            ),
                                            child: Text(
                                              'Ver Solicitudes',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: ScreenUtil().setHeight(5)),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(12),
                                              bottom: ScreenUtil().setHeight(12),
                                              left: ScreenUtil().setWidth(10),
                                            ),
                                            child: Text(
                                              'Ver Todas',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(12),
                                              bottom: ScreenUtil().setHeight(12),
                                              left: ScreenUtil().setWidth(10),
                                            ),
                                            child: Text(
                                              'Reporte Reservas',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(20),
                              ),
                              SideMenuItem(
                                controller: _controller,
                                title: 'Ventas',
                                expanded: _controller.expanded6,
                                position: 6,
                                heightExpanded: ScreenUtil().setHeight(55) + ScreenUtil().setHeight(410),
                                aseetUrl: 'assets/svg/home.svg',
                                content: SizedBox(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Opciones :',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(12),
                                              bottom: ScreenUtil().setHeight(12),
                                              left: ScreenUtil().setWidth(10),
                                            ),
                                            child: Text(
                                              'Ventas pendientes de declarar',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(12),
                                              bottom: ScreenUtil().setHeight(12),
                                              left: ScreenUtil().setWidth(10),
                                            ),
                                            child: Text(
                                              'Historial de ventas declaradas',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(12),
                                              bottom: ScreenUtil().setHeight(12),
                                              left: ScreenUtil().setWidth(10),
                                            ),
                                            child: Text(
                                              'Resumen diario',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(12),
                                              bottom: ScreenUtil().setHeight(12),
                                              left: ScreenUtil().setWidth(10),
                                            ),
                                            child: Text(
                                              'Historial de resumen diario',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(12),
                                              bottom: ScreenUtil().setHeight(12),
                                              left: ScreenUtil().setWidth(10),
                                            ),
                                            child: Text(
                                              'Historial Comunicación Baja',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Container(
            height: double.infinity,
            width: ScreenUtil().setWidth(1),
            color: const Color(0xffebebeb),
          ),
          Container(
            height: double.infinity,
            width: ScreenUtil().setWidth(1),
            color: const Color(0xfff8f8f8),
          )
            ],
          );
        });
  }
}