import 'package:capitan_flutter_web/src/bloc/provider_bloc.dart';
import 'package:capitan_flutter_web/src/models/solicitudes_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class VerSolicitudes extends StatelessWidget {
  const VerSolicitudes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final solicitudesBloc = ProviderBloc.solicitudesReserva(context);
    solicitudesBloc.getSolicitudesPendientes();

    return StreamBuilder(
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
                      EmployeeDataSource employeeDataSource = EmployeeDataSource(employeeData: snapshot.data!);
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
        });
  }
}

class DataSolicitud extends StatelessWidget {
  const DataSolicitud({Key? key, required this.employeeDataSource}) : super(key: key);

  final EmployeeDataSource employeeDataSource;

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: employeeDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridColumn(
          columnName: 'id',
          label: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text(
              'ID',
            ),
          ),
        ),
        GridColumn(
          columnName: 'Tipo',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Tipo'),
          ),
        ),
        GridColumn(
          columnName: 'Nombre',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Nombre',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        GridColumn(
          columnName: 'Cancha',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Cancha'),
          ),
        ),
        GridColumn(
          columnName: 'hReserva',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Hora Reserva'),
          ),
        ),
        GridColumn(
          columnName: 'CodOperacion',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Cod Operacion'),
          ),
        ),
        GridColumn(
          columnName: 'Voucher',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Voucher / Constancia'),
          ),
        ),
        GridColumn(
          columnName: 'Pago',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Pago'),
          ),
        ),
        GridColumn(
          columnName: 'DateTime',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('DateTime Pago'),
          ),
        ),
        GridColumn(
          columnName: 'Accion',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Acción'),
          ),
        ),
      ],
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<SolicitudesModel> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'id', value: e.idSolicitud),
              DataGridCell<String>(
                  columnName: 'Tipo',
                  value: ('${e.solicitudTipo}' == '2')
                      ? 'PLIN'
                      : ('${e.solicitudTipo}' == '1')
                          ? 'YAPE'
                          : 'PAGO ONLINE'),
              DataGridCell<String>(columnName: 'Nombre', value: '${e.solicitudNombre}\n Tel:${e.solicitudTelefono} \n Cod:${e.solicitudCodigo}'),
              DataGridCell<String>(columnName: 'Cancha', value: '${e.canchaNombre} (${e.empresaNombre})'),
              DataGridCell<String>(columnName: 'hReserva', value: '${e.solicitudFecha} ${e.solicitudHora}'),
              DataGridCell<String>(columnName: 'CodOperacion', value: '${e.solicitudCodigo}'),
              const DataGridCell<String>(columnName: 'Voucher', value: 'Ver Solicitud'),
              DataGridCell<String>(columnName: 'Pago', value: 'S/.${e.solicitudPago}'),
              DataGridCell<String>(columnName: 'DateTime', value: 'S/.${e.solicitudPagoDatetime}'),
               DataGridCell<String>(columnName: 'Accion', value: 'ItemDataModel(tipo:boton,valor:{e.idSolicitud}'),
            ]))
        .toList();
  }

  // ignore: unused_field
  List<DataGridRow> _employeeData = [];
/*
  @override
  List<DataGridRow> get rows => _employeeData; */

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (e) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              e.value.toString(),
            ),
          );
        },
      ).toList(),
    );
  }
}


class ItemDataModel{

ItemDataModel({this.tipo,this.valor});
  String? tipo;
  String? valor;
}