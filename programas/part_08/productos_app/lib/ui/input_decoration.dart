import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hinText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.green,
          width: 2,
        )),
        hintText: hinText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.blueGrey),
        prefix: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.greenAccent,
              )
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.greenAccent,
          ),
        ));
  }
}
