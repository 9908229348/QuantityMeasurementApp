import 'package:flutter/material.dart';

class HorizantalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 1,
        color: Colors.blue,
      ),
    );
  }
}
