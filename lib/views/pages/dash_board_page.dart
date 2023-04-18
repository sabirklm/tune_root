import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  width: width - 320,
                  height: height - 320,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(),
                      lineTouchData: LineTouchData(
                        
                        touchTooltipData: LineTouchTooltipData(
                          
                          tooltipBgColor: Colors.blue,
                          getTooltipItems: (touchedSpots) {
                            return touchedSpots.map(
                              (LineBarSpot touchedSpot) {
                                const textStyle = TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                );
                                return LineTooltipItem(
                                  touchedSpot.spotIndex.toString(),
                                  textStyle,
                                );
                              },
                            ).toList();
                          },
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            ...List.generate(
                              10,
                              (index) => FlSpot(
                                DateTime.now()
                                    .add(Duration(days: index))
                                    .millisecondsSinceEpoch
                                    .toDouble(),
                                index.toDouble() * index.toDouble(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
