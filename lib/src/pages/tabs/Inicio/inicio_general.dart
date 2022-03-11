import 'package:capitan_flutter_web/src/pages/tabs/Inicio/Inicio/por_hora.dart';
import 'package:capitan_flutter_web/src/utils/responsive.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InicioGeneral extends StatelessWidget {
  const InicioGeneral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: Column(
              children: [
                //Carnet de presentación
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(20),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      spreadRadius: 0,
                      blurRadius: 24,
                      offset: const Offset(0, 16), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ]),
                  height: ScreenUtil().setHeight(310),
                  child: Row(children: [
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    SizedBox(
                      width: ScreenUtil().setHeight(200),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 3),
                              shape: BoxShape.circle,
                            ),
                            height: ScreenUtil().setHeight(220),
                            width: ScreenUtil().setHeight(220),
                            child: ExtendedImage.network(
                              'https://capitan.bufeotec.com/media/usuarios/669_26112021163212.jpg',
                              width: ScreenUtil().setHeight(200),
                              height: ScreenUtil().setHeight(200),
                              fit: BoxFit.cover,
                              cache: true,
                              //border: Border.all(color: Colors.red, width: 1.0),
                              //shape: boxShape,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              //cancelToken: cancellationToken,
                            ),
/*  Container(
                              margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
                              height: ScreenUtil().setHeight(200),
                              width: ScreenUtil().setHeight(200),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  'https://capitan.bufeotec.com/media/usuarios/669_26112021163212.jpg',
                                ),
                              ), 
                            ), */
                          ),
                          Text(
                            '#641',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(20),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(30)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Angelo Tapullima Del Aguila',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(20),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(30),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/carnet/ability.svg',
                              fit: BoxFit.cover,
                              height: ScreenUtil().setHeight(24),
                              width: ScreenUtil().setWidth(24),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(8),
                            ),
                            Text(
                              'Referente',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                                fontSize: ScreenUtil().setSp(14),
                                letterSpacing: ScreenUtil().setSp(0.016),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/carnet/email.svg',
                              fit: BoxFit.cover,
                              height: ScreenUtil().setHeight(24),
                              width: ScreenUtil().setWidth(24),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(8),
                            ),
                            Text(
                              'angelo.anked@gmail.com',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                                fontSize: ScreenUtil().setSp(14),
                                letterSpacing: ScreenUtil().setSp(0.016),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/carnet/numberTShirt.svg',
                              fit: BoxFit.cover,
                              height: ScreenUtil().setHeight(24),
                              width: ScreenUtil().setWidth(24),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(8),
                            ),
                            Text(
                              '10',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                                fontSize: ScreenUtil().setSp(14),
                                letterSpacing: ScreenUtil().setSp(0.016),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/carnet/position.svg',
                              fit: BoxFit.cover,
                              height: ScreenUtil().setHeight(24),
                              width: ScreenUtil().setWidth(24),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(8),
                            ),
                            Text(
                              'Volante creativo',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                                fontSize: ScreenUtil().setSp(14),
                                letterSpacing: ScreenUtil().setSp(0.016),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ]),
                ),
                Expanded(
                  child: Container(
                    height: ScreenUtil().setHeight(440),
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                      vertical: ScreenUtil().setHeight(10),
                    ),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        spreadRadius: 0,
                        blurRadius: 24,
                        offset: const Offset(0, 16), // changes position of shadow
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20),
                vertical: ScreenUtil().setHeight(10),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
                vertical: ScreenUtil().setHeight(10),
              ),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  spreadRadius: 0,
                  blurRadius: 24,
                  offset: const Offset(0, 16), // changes position of shadow
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  spreadRadius: 0,
                  blurRadius: 1,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Canchas disponibles por horas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  const Expanded(
                    child: PorHoraPage(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }}
