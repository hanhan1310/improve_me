import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleTextWidget extends StatelessWidget {
  TitleTextWidget({required this.data, super.key});
  String data;

  @override
  Widget build(BuildContext context) {
    return Text(data.tr, style: Theme.of(context).textTheme.titleSmall,);
  }
}
