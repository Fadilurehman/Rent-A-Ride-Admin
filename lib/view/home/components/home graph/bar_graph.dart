import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/text.dart';
import 'package:r_r_admin/view/home/components/home%20graph/bar_data.dart';

class BarGraphSection extends StatelessWidget {
  final List totalData;
  final Size size;
  const BarGraphSection({
    super.key,
    required this.totalData,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    // initialize bar data
    BarData myBarData = BarData(
      cars: totalData[0],
      drivers: totalData[1],
      users: totalData[2],
      bookings: totalData[3],
    );
    myBarData.initializeBarData();
    return SizedBox(
      height: size.width * 0.7,
      child: BarChart(
        BarChartData(
          maxY: 50,
          minY: 0,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(
            show: true,
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getBottomTitles,
              ),
            ),
          ),
          barGroups: myBarData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y.toDouble(),
                      color: bodyColor,
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 50,
                        color: grey300,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta data) {
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text(
        "CARS",
        style: barText,
      );
      break;
    case 1:
      text = Text(
        "DRIVERS",
        style: barText,
      );
      break;
    case 2:
      text = Text(
        "USERS",
        style: barText,
      );
      break;
    case 3:
      text = Text(
        "BOOKINGS",
        style: barText,
      );
      break;
    default:
      text = Text("", style: barText);
  }
  return SideTitleWidget(
    axisSide: data.axisSide,
    child: text,
  );
}
