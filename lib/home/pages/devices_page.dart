import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/model/device.dart';
import 'package:digital_card_website/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  static final Map<String, String> _columns = {
    'id': 'Identifier',
    'displayName': 'Display Name',
    'link': 'Active Link'
  };
  late final List<DeviceModel> _devices;
  late final DeviceDataSource _source;

  @override
  void initState() {
    super.initState();
    _devices = const [
      DeviceModel(
        id: "94185985692",
        displayName: "Teacher",
        activeLink: 'https://www.youtube.com/',
      ),
      DeviceModel(
        id: "85494838943",
        displayName: "Employee",
        activeLink: 'https://google.com/',
      ),
    ];
    _source = DeviceDataSource(cards: _devices);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        SfDataGridTheme(
          data: SfDataGridThemeData(
            headerColor: kSideMenuBgColor,
            rowHoverTextStyle: const TextStyle(color: kPrimaryColor),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: const Border(
                right: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.26),
                ),
                top: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.26),
                ),
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.26),
                ),
                left: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.26),
                ),
              ),
            ),
            child: SfDataGrid(
              source: _source,
              columns: getColumns(),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            SizedBox(
              width: 140,
              height: 40,
              child: PrimaryButton(
                onClick: () {},
                text: 'Add new device',
                isEnabled: () => true,
                enabledColor: kPrimaryColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 120,
              height: 40,
              child: PrimaryButton(
                onClick: () {},
                text: 'Buy a device',
                isEnabled: () => true,
                enabledColor: kPrimaryColor,
              ),
            )
          ],
        )
      ],
    );
  }

  List<GridColumn> getColumns() {
    final List<GridColumn> columns = [];
    _columns.forEach((key, value) {
      columns.add(
        GridColumn(
          columnWidthMode: ColumnWidthMode.fill,
          columnName: key,
          label: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      );
    });
    return columns;
  }
}

class DeviceDataSource extends DataGridSource {
  List<DataGridRow> _rows = [];

  DeviceDataSource({
    required List<DeviceModel> cards,
  }) {
    _rows = cards.map<DataGridRow>((DeviceModel device) {
      return DataGridRow(
        cells: [
          DataGridCell(columnName: 'id', value: device.id),
          DataGridCell(columnName: 'displayName', value: device.displayName),
          DataGridCell(columnName: 'link', value: device.activeLink),
        ],
      );
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      color: Colors.white,
      cells: row.getCells().map((DataGridCell cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            cell.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
    );
  }
}
