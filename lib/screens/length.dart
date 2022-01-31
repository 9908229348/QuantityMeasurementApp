import 'package:flutter/material.dart';
import 'package:quantity_measurement_app/utils/dropdown_menu.dart';
import 'package:quantity_measurement_app/utils/horizantal_line.dart';

class LengthConversion extends StatefulWidget {
  const LengthConversion({Key? key}) : super(key: key);

  @override
  _LengthConversionState createState() => _LengthConversionState();
}

class _LengthConversionState extends State<LengthConversion> {
  String inputUnit = '';
  String outputUnit = '';
  double inputValue = 0.0;
  double outputValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Length Conversion"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              "Select input unit",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            DropDownMenu(
                callBack: (value) {
                  inputUnit = value;
                },
                items: ['Cm', 'mm', 'm', 'Km']),
            HorizantalLine(),
            const Text(
              "Select output unit",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            //const Test(),
            DropDownMenu(
                callBack: (value) {
                  outputUnit = value;
                },
                items: ['Cm', 'mm', 'm', 'Km']),
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
                      color: Colors.blue,
                      child: Center(
                          child: Text(
                        "${outputValue.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                  ),
                )
              ],
            ),
            RaisedButton(
                color: Colors.blue,
                child: const Text("Convert"),
                onPressed: () {
                  calculateOutPut(inputUnit, outputUnit, inputValue);
                })
          ],
        ),
      ),
    );
  }

  int convertOptions(String unit) {
    int option = 1;

    switch (unit) {
      case "Km":
        option = 1;
        break;
      case "m":
        option = 2;
        break;
      case "Cm":
        option = 3;
        break;
      case "mm":
        option = 4;
    }
    return option;
  }

  double calculateOutPut(
      String inputUnit, String outputUnit, double inputValue) {
    int convertedInputUnit = convertOptions(inputUnit);
    int convertedOutputUnit = convertOptions(outputUnit);

    //double output;

    dynamic map = {
      1: [1.0, 1000.0, 100000.0, 1000000.0],
      2: [0.001, 1.0, 100.0, 1000.0],
      3: [0.00001, 0.01, 1.0, 10],
      4: [0.000001, 0.001, 0.1, 1.0]
    };

    outputValue = inputValue * map[convertedInputUnit][convertedOutputUnit - 1];
    setState(() {});
    return outputValue;
  }
}
