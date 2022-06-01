import 'package:digital_card_website/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SelectionButtonData {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  final int? totalNotif;

  const SelectionButtonData({
    required this.activeIcon,
    required this.icon,
    required this.label,
    this.totalNotif,
  });
}

class SelectionButton extends StatefulWidget {
  final int initialSelection;
  final List<SelectionButtonData> data;
  final Function(int index, SelectionButtonData value) onSelected;
  const SelectionButton({
    Key? key,
    required this.initialSelection,
    required this.data,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  late int selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelection;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.data.asMap().entries.map((e) {
      final int index = e.key;
      final data = e.value;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: _SelectableButton(
          selected: selected == index,
          data: data,
          onPressed: () {
            widget.onSelected(index, data);
            setState(() {
              selected = index;
            });
          },
        ),
      );
    }).toList());
  }
}

class _SelectableButton extends StatelessWidget {
  final bool selected;
  final SelectionButtonData data;
  final VoidCallback onPressed;

  const _SelectableButton({
    required this.selected,
    required this.data,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? Theme.of(context).primaryColor.withOpacity(.1) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              _buildIcon(context),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: _buildLabel(context)),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: _buildNotification(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Icon(selected ? data.icon : data.activeIcon,
        size: 20, color: _getColor(context));
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      data.label,
      style: TextStyle(
        color: _getColor(context),
        fontWeight: FontWeight.bold,
        letterSpacing: 0.8,
        fontSize: 14,
      ),
    );
  }

  Widget _buildNotification() {
    if (data.totalNotif == null || data.totalNotif! <= 0) {
      return Container();
    } else {
      return Container(
        width: 30,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Text(
          _notifText(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  String _notifText() {
    if (data.totalNotif! >= 100) {
      return "99+";
    } else {
      return "${data.totalNotif}";
    }
  }

  Color _getColor(BuildContext context) {
    return !selected ? kFontColorPallets[1] : Theme.of(context).primaryColor;
  }
}
