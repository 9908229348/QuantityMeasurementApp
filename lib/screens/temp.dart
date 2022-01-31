import 'package:flutter/material.dart';
import 'package:quantity_measurement_app/utils/dropdown_menu.dart';

class Temp extends StatefulWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  String unitOne = '';
  String unitTwo = '';
  double valueOne = 0.0;
  double valueTwo = 0.0;
  bool isFirstTextFieldEnable = true;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Temperature Conversion"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
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
                        hintText: valueOne.toStringAsFixed(2).toString(),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value){
                        isFirstTextFieldEnable = true;
                        valueOne = double.parse(value);
                        calculateOutput(unitOne, unitTwo, valueOne);
                      },
                    ),
                  ),
                ),
                DropDownMenu(
                    callBack: (value) {
                      unitOne = value;
                    },
                    items: ['Celsius', 'Fahrenheit', 'Kelvin'])
              ],
            ),
            Column(
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
                        hintText: valueTwo.toStringAsFixed(2).toString(),
                      ),
                      onChanged: (String value){
                        isFirstTextFieldEnable = false;
                        valueTwo = double.parse(value);
                        calculateOutput(unitTwo, unitOne, valueTwo);
                      },
                    ),
                  ),
                ),
                DropDownMenu(
                    callBack: (value) {
                      unitTwo = value;
                    },
                    items: ['Celsius', 'Fahrenheit', 'Kelvin'])
              ],
            ),
          ],
        ),
      ),
    );
  }

  int convertOptions(String unit) {
    int option = 1;
    switch (unit) {
      case "Celsius":
        option = 1;
        break;
      case "Fahrenheit":
        option = 2;
        break;
      case "Kelvin":
        option = 3;
    }
    return option;
  }

  calculateOutput(
      String inputUnit, String outputUnit, double inputValue) {
    int convertedInputUnit = convertOptions(inputUnit);
    int convertedOutputUnit = convertOptions(outputUnit);

    double value = 0.0;

    switch (convertedInputUnit) {
      case 1:
        value = celsiusConversions(inputValue, convertedOutputUnit);
        print("$valueTwo");
        break;
      case 2:
        value = fahrenheitConversions(inputValue, convertedOutputUnit);
        break;
      case 3:
        value = kelvinConversions(inputValue, convertedOutputUnit);
    }

    if(isFirstTextFieldEnable){
      valueTwo = value;
    }else {
      valueOne = value;
    }
    setState(() {});
  }

  double celsiusConversions(double value, int choice) {
    double result = 0;
    switch (choice) {
      case 1:
        result = value * 1;
        break;
      case 2:
        result = (9 / 5 * value) + 32;
        break;
      case 3:
        result = value + 273.15;
        break;
    }
    return result;
  }

  double fahrenheitConversions(double value, int choice) {
    double result = 0;
    switch (choice) {
      case 1:
        result = (value - 32) * 5 / 9;
        break;
      case 2:
        result = value * 1;
        break;
      case 3:
        result = (value - 32) * 5 / 9 + 273.15;
        break;
    }
    return result;
  }

  

  double kelvinConversions(double value, int choice) {
    double result = 0;
    switch (choice) {
      case 1:
        result = value - 273.15;
        break;
      case 2:
        result = ((value - 273.15) * 9 / 5) + 32;
        break;
      case 3:
        result = value * 1;
        break;
    }
    return result;
  }
}
