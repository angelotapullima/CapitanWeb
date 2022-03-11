import 'package:capitan_flutter_web/src/models/cancha_disponibles_model.dart';
import 'package:capitan_flutter_web/src/models/canchas_model.dart';
import 'package:capitan_flutter_web/src/utils/constants.dart';
import 'package:capitan_flutter_web/src/utils/responsive.dart';
import 'package:capitan_flutter_web/src/utils/utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpansionPrueba extends StatefulWidget {
  const ExpansionPrueba({Key? key, required this.hora, required this.canchas, required this.origenMetricaReserva}) : super(key: key);

  final String hora;
  final String origenMetricaReserva;
  final List<CanchasDisponiblesConEmpresas> canchas;

  @override
  _ExpansionPruebaState createState() => _ExpansionPruebaState();
}

class _ExpansionPruebaState extends State<ExpansionPrueba> {
  bool change = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final List<Widget> imageSliders = widget.canchas
        .map(
          (item) => EmpresasCanchasList(
            canchitas: item.canchasList!,
            nombreEmpresa: item.nombreEmpresa!,
            hora: widget.hora,
            origenMetricaReserva: widget.origenMetricaReserva,
          ),
        )
        .toList();

    return ExpansionTile(
        onExpansionChanged: (valor) {
          if (kDebugMode) {
            print(valor);
          }
          setState(() {
            change = valor;
          });
        },
        trailing: SizedBox(
          //margin: EdgeInsets.symmetric(vertical: responsive.hp(.5)),
          child: CircleAvatar(
            radius: responsive.ip(1.5),
            backgroundColor: const Color(0xfff7f7f7),
            child: Icon(
              change ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transformarHoraA12Horas(widget.hora),
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: ScreenUtil().setSp(17)),
            ),
            const Divider()
          ],
        ),
        children: imageSliders);
  }
}

class EmpresasCanchasList extends StatefulWidget {
  const EmpresasCanchasList({
    Key? key,
    required this.canchitas,
    required this.nombreEmpresa,
    required this.hora,
    required this.origenMetricaReserva,
  }) : super(key: key);

  final List<CanchasDisponiblesResult> canchitas;
  final String nombreEmpresa;
  final String hora;
  final String origenMetricaReserva;

  @override
  _EmpresasCanchasListState createState() => _EmpresasCanchasListState();
}

class _EmpresasCanchasListState extends State<EmpresasCanchasList> {
  @override
  Widget build(BuildContext context) {
    return (widget.canchitas.isNotEmpty)
        ? ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: 2,
            itemBuilder: (_, index) {
              if (index == 0) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nombreEmpresa,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                    ],
                  ),
                );
              }

              return GridView.builder(
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: widget.canchitas.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    mainAxisSpacing: ScreenUtil().setHeight(30),
                    crossAxisSpacing: ScreenUtil().setWidth(10),
                  ),
                  itemBuilder: (context, i) {
                    return LayoutBuilder(builder: (context, constraint) {
                      return GestureDetector(
                        onTap: () async {
                          // if (widget.canchitas[ii].soyAdmin == 1) {
                          CanchasResult canchasResult = CanchasResult();
                          canchasResult.idEmpresa = widget.canchitas[i].empresaId;
                          canchasResult.canchaId = widget.canchitas[i].canchaId;
                          canchasResult.nombre = widget.canchitas[i].canchaNombre;
                          canchasResult.precioD = widget.canchitas[i].canchaPrecioD;
                          canchasResult.precioN = widget.canchitas[i].canchaPrecioN;
                          canchasResult.promoInicio = widget.canchitas[i].canchaPromoInicio;
                          canchasResult.promoFin = widget.canchitas[i].canchaPromoFin;
                          canchasResult.promoEstado = widget.canchitas[i].canchaPromoEstado;
                          canchasResult.promoPrecio = widget.canchitas[i].canchaPromoPrecio;
                          canchasResult.precioCancha = widget.canchitas[i].canchaPrecioFinal;
                          canchasResult.nombreEmpresa = widget.nombreEmpresa;
                          canchasResult.comisionCancha = widget.canchitas[i].comisionCancha;

                          /*  ReservaCancha2Model reservaEnviar = ReservaCancha2Model();
                            reservaEnviar.idCancha = widget.canchitas[i].canchaId;
                            reservaEnviar.nombreCancha = widget.canchitas[i].canchaNombre;
                            reservaEnviar.nombreNegocio = widget.canchitas[i].empresaNombre;
                            //Fecha formateada
                            //reservaEnviar.fecha = '2021-09-21';
                            reservaEnviar.fecha = obtenerFechaReservas(widget.canchitas[i].fechaActual!);

                            reservaEnviar.hora = widget.canchitas[i].canchaHoraCancha;

                            reservaEnviar.pago1 = widget.canchitas[i].canchaPrecioFinal;
                            reservaEnviar.pagoComision = widget.canchitas[i].comisionCancha;
                            reservaEnviar.origenMetrica = widget.origenMetricaReserva;

                            var horas = widget.hora.split(' ');
                            reservaEnviar.horaReserva = '${horas[0]} - ${horas[3]}';

                            print('Horas Hora Reserva: ${reservaEnviar.horaReserva} - Hora  ${reservaEnviar.hora}'); */

                          //modalSeletPayMetod(context, reservaEnviar);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: Stack(
                              children: <Widget>[
                                ExtendedImage.network(
                                  '$apiBaseURL/${widget.canchitas[i].canchaFoto}',
                                  width: constraint.maxWidth,
                                  height: constraint.maxHeight,
                                  fit: BoxFit.cover,
                                  cache: true,
                                  //border: Border.all(color: Colors.red, width: 1.0),
                                  //shape: boxShape,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  //cancelToken: cancellationToken,
                                ),

                                /* ImageCacheCustom(
                                    url: '$apiBaseURL/${widget.canchitas[i].canchaFoto}',
                                    alto: double.infinity,
                                    ancho: double.infinity,
                                    ontap: (){},
                                  ), */
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(5),
                                      vertical: ScreenUtil().setHeight(5),
                                    ),
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                      ),
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: SizedBox(
                                            width: ScreenUtil().setWidth(85),
                                            child: Text(
                                              '${widget.canchitas[i].canchaNombre}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(14),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(5),
                                        ),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(65),
                                          child: Text(
                                            'S/${widget.canchitas[i].canchaPrecioFinal}',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: ScreenUtil().setSp(16),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: ScreenUtil().setHeight(5),
                                  left: ScreenUtil().setWidth(5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ('${widget.canchitas[i].tipo}' == '1')
                                          ? Colors.green
                                          : ('${widget.canchitas[i].tipo}' == '2')
                                              ? Colors.red
                                              : ('${widget.canchitas[i].tipo}' == '3')
                                                  ? Colors.yellow[900]
                                                  : Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(5),
                                      vertical: ScreenUtil().setWidth(3),
                                    ),
                                    child: Text(
                                      '${widget.canchitas[i].tipoNombre}  |  ${widget.canchitas[i].deporte}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(14),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  });

              /* 
            */
            })
        : Container();
  }
}
