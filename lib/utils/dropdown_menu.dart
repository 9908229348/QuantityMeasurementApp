import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  Function callBack;
  List<String> items;

  DropDownMenu({required this.callBack, required this.items});

  @override
  _DropDownMenuState createState() =>
      _DropDownMenuState(callBack: this.callBack, items: this.items);
}

class _DropDownMenuState extends State<DropDownMenu> {
  String dropDownValueOutput = "";

  List<String> items;

  Function callBack;

  _DropDownMenuState({required this.callBack, required this.items});

  @override
  void initState() {
    super.initState();
    dropDownValueOutput = items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton(
        value: dropDownValueOutput,
        icon: Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(
            child: Text(items),
            value: items,
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValueOutput = newValue!;
            callBack(newValue);
          });
        },
      ),
    );
  }
}
