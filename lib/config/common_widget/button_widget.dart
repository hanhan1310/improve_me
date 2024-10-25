import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  late String inputText;
  late var screen;
  ButtonWidget(this.inputText, this.screen);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffA3EAFF),
            side: BorderSide(
              color: Colors.black,
              width: 1.0,
            )
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => (screen)));
        },

        child: Center(
          child: Text(
            inputText,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Colors.black),
          ),
        ));
  }
}
