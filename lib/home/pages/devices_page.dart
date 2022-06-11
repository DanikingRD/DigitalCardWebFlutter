import 'package:digital_card_website/model/device.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  static const List<String> _columns = ["Identifier", "Display Name"];
  late final List<DeviceModel> _devices;

  @override
  void initState() {
    super.initState();
    _devices = const [
      DeviceModel(id: "94185985692", displayName: "Teacher"),
      DeviceModel(id: "85494838943", displayName: "Employee")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      columns: getColumns(),
      rows: [],
      onLoaded: (PlutoGridOnLoadedEvent event) {
        event.stateManager.setShowColumnFilter(true);
      },
      onChanged: (PlutoGridOnChangedEvent event) {
        print(event);
      },
      configuration: const PlutoGridConfiguration(),
      createFooter: (stateManager) {
        stateManager.setPageSize(100, notify: false); // default 40
        return PlutoPagination(stateManager);
      },
    );
  }

  // TODO: Fix exceptions
  List<PlutoRow> getRows() {
    return _devices.map((DeviceModel device) {
      return PlutoRow(
        cells: {},
      );
    }).toList();
  }

  List<PlutoColumn> getColumns() {
    return _columns.map((String name) {
      return PlutoColumn(
        title: name,
        field: name,
        type: PlutoColumnType.text(),
      );
    }).toList();
  }
}
