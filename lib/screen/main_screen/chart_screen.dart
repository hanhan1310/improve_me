import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: PieChart(
        swapAnimationCurve: Curves.easeInOut,
        swapAnimationDuration: Duration(milliseconds: 500),
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 80,
              color: Colors.red,
            ),
            PieChartSectionData(
              value: 20,
              color: Colors.blue,
            ),
            PieChartSectionData(
              value: 20,
              color: Colors.blue,
            ),
            PieChartSectionData(
              value: 20,
              color: Colors.blue,
            ),
            PieChartSectionData(
              value: 20,
              color: Colors.blue,
            ),
          ]
        )
      ),
    );
  }
}
