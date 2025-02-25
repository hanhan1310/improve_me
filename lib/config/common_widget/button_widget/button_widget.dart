import 'package:flutter/material.dart';

import '../text_widget/title_small_widget.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({required this.data, required this.onPressed, super.key});
  String data;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle:
          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      child: Center(
        child: TitleSmallWidget(data: data),
      ),
    );
  }
}
