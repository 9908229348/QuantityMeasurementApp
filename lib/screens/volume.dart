import 'package:flutter/material.dart';
import 'package:quantity_measurement_app/utils/dropdown_menu.dart';
import 'package:quantity_measurement_app/utils/horizantal_line.dart';

class VolumeConversion extends StatefulWidget {
  const VolumeConversion({Key? key}) : super(key: key);

  @override
  _VolumeConversionState createState() => _VolumeConversionState();
}

class _VolumeConversionState extends State<VolumeConversion> {
  String inputUnit = '';
  String outputUnit = '';
  double inputValue = 0.0;
  double outputValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Volume Conversion"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Select input unit",
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              DropDownMenu(
                  callBack: (value) {
                    inputUnit = value;
                  },
                  items: ['lt', 'ml', 'Gallon']),
              HorizantalLine(),
              Text(
                "Select output unit",
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              DropDownMenu(
                  callBack: (value) {
                    outputUnit = value;
                  },
                  items: ['lt', 'ml', 'Gallon']),
              HorizantalLine(),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: SizedBox(
                      width: 150,
                      child: TextField(
                        style: TextStyle(height: 1.0),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'input',
                          hintText: 'Enter input value',
                        ),
                        onChanged: (String value) {
                          try {
                            inputValue = double.parse(value);
                          } catch (expection) {
                            inputValue = 0.0;
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: 150,
                      child: Container(
                        height: 55,
                        color: Colors.green,
                        child: Center(
                            child: Text(
                          "$outputValue",
                          style: TextStyle(fontSize: 20),
                        )),
                      ),
                    ),
                  )
                ],
              ),
              RaisedButton(
                  color: Colors.green,
                  child: Text("Convert"),
                  onPressed: () {
                    calculateOutput(inputUnit, outputUnit, inputValue);
                  })
            ],
          )),
    );
  }

  int convertOptions(String unit) {
    int option = 1;
    switch (unit) {
      case "lt":
        option = 1;
        break;
      case "ml":
        option = 2;
        break;
      case "Gallon":
        option = 3;
    }
    return option;
  }

  double calculateOutput(
      String inputUnit, String outputUnit, double inputValue) {
    int convertedInputUnit = convertOptions(inputUnit);
    int convertedOutputUnit = convertOptions(outputUnit);

    dynamic map = {
      1: [1.0, 1000.0, 0.264172],
      2: [0.001, 1.0, 0.000264172],
      3: [3.78541, 3785.41, 1.0]
    };

    outputValue = inputValue * map[convertedInputUnit][convertedOutputUnit - 1];

    setState(() {});
    return outputValue;
  }
}
