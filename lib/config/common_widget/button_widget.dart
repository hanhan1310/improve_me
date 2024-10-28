import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  late String inputText;
  late var screen;

  ButtonWidget(this.inputText, this.screen);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffA3EAFF),
          side: BorderSide(
            color: Colors.black,
            width: 1.0,
          )),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => (widget.screen)),
            (route) => false);
      },
      child: Center(
        child: Text(
          widget.inputText,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 17, color: Colors.black),
        ),
      ),
    );
  }
}
