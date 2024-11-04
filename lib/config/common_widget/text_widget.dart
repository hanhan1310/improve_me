import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String inputString;
  TextWidget(this.inputString);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 12
      ),
      onTapOutside: (even) {
        FocusScope.of(context).unfocus();
      },
      autofocus: false,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: inputString,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffA3EAFF), width: 1.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
