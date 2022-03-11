import 'package:capitan_flutter_web/src/Api/solicitudes_api.dart';
import 'package:capitan_flutter_web/src/bloc/provider_bloc.dart';
import 'package:capitan_flutter_web/src/models/solicitudes_model.dart';
import 'package:capitan_flutter_web/src/pages/tabs/Solicitudes/bloc_solicitudes.dart';
import 'package:capitan_flutter_web/src/utils/constants.dart';
import 'package:capitan_flutter_web/src/utils/responsive.dart';
import 'package:capitan_flutter_web/src/utils/utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class VerSolicitudes extends StatefulWidget {
  const VerSolicitudes({Key? key}) : super(key: key);

  @override
  State<VerSolicitudes> createState() => _VerSolicitudesState();
}

class _VerSolicitudesState extends State<VerSolicitudes> {
  @override
  Widget build(BuildContext context) {
    final solicitudesBloc = ProviderBloc.solicitudesReserva(context);
    solicitudesBloc.getSolicitudesPendientes();
    final responsive = Responsive.of(context);

    final provider = Provider.of<SolicitudBloc>(context, listen: false);

    return Stack(
      children: [
        StreamBuilder(
            stream: solicitudesBloc.cargandoSolicitudStream,
            builder: (context, AsyncSnapshot<bool> valorBolean) {
              if (valorBolean.hasData) {
                if (valorBolean.data!) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else {
                  return StreamBuilder(
                    stream: solicitudesBloc.solicitudPendientesStream,
                    builder: (context, AsyncSnapshot<List<SolicitudesModel>> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isNotEmpty) {
                          EmployeeDataSource employeeDataSource = EmployeeDataSource(
                            context,
                            responsive,
                            provider,
                            employeeData: snapshot.data!,
                          );
                          return DataSolicitud(employeeDataSource: employeeDataSource);
                        } else {
                          return const Center(
                            child: Text('No hay solicitudes pendientes'),
                          );
                        }
                      } else {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                    },
                  );
                }
              } else {
                return Container();
              }
            }),
        ValueListenableBuilder(
          valueListenable: provider.cargando,
          builder: (BuildContext context, bool data, Widget? child) {
            if (kDebugMode) {
              print('data ctm $data');
            }
            return (data) ? _mostrarAlert(responsive) : Container();
          },
        ),
      ],
    );
  }

  Widget _mostrarAlert(Responsive responsive) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromRGBO(0, 0, 0, 0.5),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: responsive.hp(20),
              child: Lottie.asset('assets/lottie/balon_futbol.json'),
            ),
          ],
        ),
      ),
    );
  }
}

class DataSolicitud extends StatelessWidget {
  const DataSolicitud({Key? key, required this.employeeDataSource}) : super(key: key);

  final EmployeeDataSource employeeDataSource;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(10),
        ),
        padding: EdgeInsets.symmetric(
          // horizontal: ScreenUtil().setWidth(20),
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20),
              ),
              child: const Text(
                'Lista de Solicitudes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                ),
                child: SfDataGrid(
                  isScrollbarAlwaysShown: true,
                  //showCheckboxColumn:true,
                  source: employeeDataSource,
                  footer: Row(
                    children: [
                      Text('Mostrando ${employeeDataSource._employeeData.length} solicitudes'),
                    ],
                  ),
                  rowHeight: ScreenUtil().setHeight(150),
                  columnWidthMode: (constraints.maxWidth < 800) ? ColumnWidthMode.fitByColumnName : ColumnWidthMode.fill,
                  gridLinesVisibility: GridLinesVisibility.horizontal,
                  headerGridLinesVisibility: GridLinesVisibility.horizontal,
                  columns: <GridColumn>[
                    GridColumn(
                      columnName: '  id  ',
                      label: Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: const Text(
                          '  ID ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 53, 92),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Tipo',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'Tipo',
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 53, 92),
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: '  Nombre  ',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(
                          '   Nombre   ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 53, 92),
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Cancha',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'Cancha',
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 53, 92),
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: 'hReserva',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'Hora Reserva',
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 53, 92),
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: 'CodOperacion',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'Cod\nOperación',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 53, 92),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: '  Voucher  ',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'Voucher / Constancia',
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 53, 92),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: '  Pago  ',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'Pago',
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 53, 92),
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: 'DateTime',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'DateTime Pago',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 53, 92),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: '   Accion   ',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'Acción',
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 53, 92),
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class EmployeeDataSource extends DataGridSource {
  final BuildContext context;
  final Responsive responsive;
  final SolicitudBloc provider;

  /// Creates the employee data source class with required details.
  EmployeeDataSource(
    this.context,
    this.responsive,
    this.provider, {
    required List<SolicitudesModel> employeeData,
  }) {
    _employeeData = employeeData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<ItemDataModel>(
                columnName: '  id  ',
                value: ItemDataModel(tipo: 'nombre', valor: '${e.idSolicitud}'),
              ),
              DataGridCell<ItemDataModel>(
                columnName: 'Tipo',
                value: ItemDataModel(
                    tipo: 'tipo',
                    valor: ('${e.solicitudTipo}' == '2')
                        ? 'PLIN'
                        : ('${e.solicitudTipo}' == '1')
                            ? 'YAPE'
                            : 'PAGO ONLINE'),
              ),
              DataGridCell<ItemDataModel>(
                columnName: '   Nombre   ',
                value: ItemDataModel(tipo: 'nombre', valor: '${e.solicitudNombre}\nTel:${e.solicitudTelefono}\nCod:${e.solicitudCodigo}'),
              ),
              DataGridCell<ItemDataModel>(
                columnName: 'Cancha',
                value: ItemDataModel(tipo: 'normal', valor: '${e.canchaNombre} (${e.empresaNombre})'),
              ),
              DataGridCell<ItemDataModel>(
                columnName: 'hReserva',
                value: ItemDataModel(tipo: 'normal', valor: '${e.solicitudFecha} ${e.solicitudHora}'),
              ),
              DataGridCell<ItemDataModel>(
                columnName: 'CodOperacion',
                value: ItemDataModel(tipo: 'normal', valor: '${e.solicitudCodigo}'),
              ),
              DataGridCell<ItemDataModel>(
                columnName: '  Voucher  ',
                value: ItemDataModel(tipo: 'foto', valor: '${e.solicitudFile}'),
              ),
              DataGridCell<ItemDataModel>(
                columnName: '  Pago  ',
                value: ItemDataModel(tipo: 'normal', valor: 'S/.${e.solicitudPago}'),
              ),
              DataGridCell<ItemDataModel>(
                columnName: 'DateTime',
                value: ItemDataModel(tipo: 'normal', valor: '${e.solicitudPagoDatetime}'),
              ),
              DataGridCell<ItemDataModel>(
                columnName: '   Accion   ',
                value: ItemDataModel(tipo: 'boton', valor: '${e.idSolicitud}'),
              ),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return (e.value.tipo == 'boton')
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  shape: const RoundedRectangleBorder(),
                  color: Colors.blue,
                  onPressed: () async {
                    showValidarDialog(context, '${e.value.valor}', '1', responsive);
                    /* provider.changeCargandoTrue();
                    final solicitudesApi = SolicitudesApi();
                    //final res = await solicitudesApi.cambiarEstadoSolicitud('${e.value.valor}', '1');
                    final res = await solicitudesApi.cambiarEstadoSolicitud('334567', '1');
                    if (res == 1) {
                      showToast2('la Solicitud fue aprobada', Colors.green);
                    } else {
                      showToast2('Ocurrio un error', Colors.red);
                    }
                    final solicitudesBloc = ProviderBloc.solicitudesReserva(context);
                    solicitudesBloc.getSolicitudesPendientes();
                    provider.changeCargandoFalse(); */
                  },
                  child: const Text(
                    'Aprobar',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                MaterialButton(
                  shape: const RoundedRectangleBorder(),
                  color: Colors.red,
                  onPressed: () async {
                    showValidarDialog(context, e.value.valor, '2', responsive);
                  },
                  child: const Text(
                    'Rechazar',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          : (e.value.tipo == 'foto')
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showProcessingDialog(context, '$apiBaseURL/${e.value.valor}', responsive);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(2),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade900,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Ver foto',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : (e.value.tipo == 'nombre')
                  ? Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e.value.valor.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    )
                  : (e.value.tipo == 'tipo')
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (e.value.valor == 'PLIN')
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(45, 200, 230, 201),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(8),
                                    ),
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e.value.valor.toString(),
                                      style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                : (e.value.valor == 'YAPE')
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(143, 225, 190, 231),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: ScreenUtil().setWidth(8),
                                        ),
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          e.value.valor.toString(),
                                          style: TextStyle(
                                            color: Colors.purple.shade800,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil().setSp(16),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade100,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: ScreenUtil().setWidth(8),
                                        ),
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          e.value.valor.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.red.shade800,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil().setSp(16),
                                          ),
                                        ),
                                      ),
                          ],
                        )
                      : Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              e.value.valor.toString(),
                            ),
                          ),
                        );
    }).toList());
  }

  void showProcessingDialog(BuildContext context, String foto, Responsive responsive) async {
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
          contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          content: Center(
            child: Container(
              color: Colors.white,
              width: responsive.wp(30),
              child: ExtendedImage.network(
                foto,
                width: double.infinity / 5,
                height: double.infinity / 2,
                fit: BoxFit.fitHeight,
                cache: true,
                //border: Border.all(color: Colors.red, width: 1.0),
                //shape: boxShape,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                //cancelToken: cancellationToken,
              ),
            ),
          ),
        );
      },
    );
  }

  void showValidarDialog(BuildContext context, String id, String tipo, Responsive responsive) async {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: responsive.hp(32),
            horizontal: responsive.wp(30),
          ),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            content: Container(
              margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
              child: Column(
                children: [
                  (tipo == '1')
                      ? const Text(
                          '¿Estás seguro que desea Aprobar la solicitud?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Text(
                          '¿Estás seguro que desea Rechazar la solicitud?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  SizedBox(
                    height: responsive.hp(5),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              color: Colors.blue,
                              child: const Text(
                                '    SI    ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                provider.changeCargandoTrue();
                                final solicitudesApi = SolicitudesApi();

                                final res = await solicitudesApi.cambiarEstadoSolicitud(id, tipo);
                                //await solicitudesApi.cambiarEstadoSolicitud('${snapshot.data![index].idSolicitud}', '2');

                                if (res == 1) {
                                  (tipo == '1')
                                      ? showToast2('la Solicitud fue Aprobado', Colors.green)
                                      : showToast2('la Solicitud fue rechazada', Colors.green);
                                } else {
                                  showToast2('Ocurrio un error', Colors.red);
                                }
                                final solicitudesBloc = ProviderBloc.solicitudesReserva(context);
                                solicitudesBloc.getSolicitudesPendientes();
                                provider.changeCargandoFalse();
                              }),
                        ),
                        SizedBox(
                          width: responsive.wp(5),
                        ),
                        Expanded(
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              color: Colors.red,
                              child: const Text(
                                '       NO      ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ItemDataModel {
  ItemDataModel({this.tipo, this.valor});
  String? tipo;
  String? valor;
}
