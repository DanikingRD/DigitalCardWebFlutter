import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  late final List<DeviceModel> _devices;
  static const List<String> _columns = ['ID', 'Device Type', 'Display Name'];
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  void initState() {
    super.initState();
    _devices = [
      DeviceModel('789098', 'Cling PVC Card', 'Daniel1'),
      DeviceModel('542123', 'Cling Basic Card', 'Daniel2'),
      DeviceModel('995846', 'Cling Steel Card', 'Daniel4'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DataTableTheme(
      data: DataTableThemeData(),
      child: PaginatedDataTable2(
        header: Text('My header'),
        columns: getColumns(),
        source: DevicesDTS(cells: getCells()),
        onRowsPerPageChanged: (row) {
          setState(() {
            _rowPerPage = row!;
          });
        },
        rowsPerPage: _rowPerPage,
      ),
    );
  }

  List<DataCell> getCells() {
    return _devices.map((e) {
      return DataCell(Text(e.displayName));
    }).toList();
  }

  List<DataColumn> getColumns() {
    return _columns.map((String col) {
      return DataColumn(label: Text(col));
    }).toList();
  }
}

class DeviceModel {
  final String id;
  final String deviceType;
  final String displayName;

  DeviceModel(this.id, this.deviceType, this.displayName);
}

class DevicesDTS extends DataTableSource {
  final List<DataCell> cells;

  DevicesDTS({
    required this.cells,
  });

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: cells,
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
