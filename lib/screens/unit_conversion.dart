import 'package:flutter/material.dart';
import 'package:quantity_measurement_app/screens/temp.dart';
import 'package:quantity_measurement_app/screens/volume.dart';

import 'length.dart';

class UnitConversion extends StatelessWidget {
  const UnitConversion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Unit Converter",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        leading: Icon(
          Icons.calculate_rounded,
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.more_vert_outlined,
            color: Colors.black,
          )
        ],
        backgroundColor: Colors.grey[350],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(
                buttonColor: Colors.blue,
                minWidth: 350,
                height: 46,
                child: RaisedButton(
                  child: Text(
                    "Length",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LengthConversion()));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(
                buttonColor: Colors.red,
                minWidth: 350,
                height: 46,
                child: RaisedButton(
                  child: Text(
                    "Temperature",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Temp()));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(
                buttonColor: Colors.green,
                minWidth: 350,
                height: 46,
                child: RaisedButton(
                  child: Text(
                    "Volume",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VolumeConversion()));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
