import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodySmallTextWidget extends StatelessWidget {
  BodySmallTextWidget({required this.data, super.key});
  String data;

  @override
  Widget build(BuildContext context) {
    return Text(data.tr, style: Theme.of(context).textTheme.bodySmall,);
  }
}
