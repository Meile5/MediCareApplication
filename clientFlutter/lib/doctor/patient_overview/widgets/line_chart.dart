import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReusableLineChart extends StatelessWidget {
  final List<MapEntry<DateTime, double>> vitalsData;
  final double minY;
  final double maxY;
  final bool showArea;
  final String unit;

  const ReusableLineChart({
    super.key,
    required this.minY,
    required this.maxY,
    required this.showArea,
    required this.unit,
    required this.vitalsData,
  });

  @override
  Widget build(BuildContext context) {
    final interval = (maxY - minY) / 5;
    final baseTime = vitalsData.first.key;
    final spots =
        vitalsData.map((entry) {
          final time = entry.key.difference(baseTime).inSeconds.toDouble();
          return FlSpot(time, entry.value);
        }).toList();

    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 1.9,
            child: LineChart(
              LineChartData(
                minY: minY,
                maxY: maxY,
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20,
                      interval:
                          (spots.length < 2)
                              ? 1
                              : (spots.last.x - spots.first.x) / 4,
                      getTitlesWidget: (value, _) {
                        final time = baseTime.add(
                          Duration(seconds: value.toInt()),
                        );
                        return Text(
                          DateFormat('MMM d').format(time),
                        ); // HH:mm format
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20,
                      interval: interval,
                      getTitlesWidget: (value, _) {
                        return Text(
                          value.toStringAsFixed(interval < 1 ? 1 : 0),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    barWidth: 2,
                    color: Colors.blue,
                    belowBarData: BarAreaData(
                      show: showArea,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter:
                          (spot, _, _, _) => FlDotCirclePainter(
                            radius: 5,
                            color: Colors.blue,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          ),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          '${spot.y.toStringAsFixed(1)} $unit',
                          TextStyle(color: Colors.white),
                        );
                      }).toList();
                    },
                  ),
                  handleBuiltInTouches: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
