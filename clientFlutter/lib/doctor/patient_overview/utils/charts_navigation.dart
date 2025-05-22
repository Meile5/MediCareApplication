import 'package:flutter/material.dart';

import '../widgets/line_chart.dart';
class ChartsNavigation extends StatefulWidget {
  final List<MapEntry<DateTime, double>> temperatureDate;
  final List<MapEntry<DateTime, double>> heartRateDate;
  final List<MapEntry<DateTime, double>> oxygenLevelDate;

  const ChartsNavigation({
    super.key,
    required this.temperatureDate,
    required this.heartRateDate,
    required this.oxygenLevelDate,
  });

  @override
  State<ChartsNavigation> createState() => _ChartsNavigationState();
}

class _ChartsNavigationState extends State<ChartsNavigation> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
       // width: MediaQuery.of(context).size.width * 0.6,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 4), // vertical drop shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
               "Vitals",
                style: TextStyle(fontSize: 18),

               ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.blueAccent.withAlpha(80),
              ),
              child: const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  Tab(text: 'Temperature'),
                  Tab(text: 'HeartRate'),
                  Tab(text: 'OxygenLevel')
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ReusableLineChart(
                      vitalsData: widget.temperatureDate,
                      minY: 35,
                      maxY: 40,
                      showArea: true,
                      unit: "°C"),

                  ReusableLineChart(
                      vitalsData: widget.heartRateDate,
                      minY: 50,
                      maxY: 120,
                      showArea: true,
                      unit: "bpm"),

                  ReusableLineChart(
                    vitalsData: widget.oxygenLevelDate,
                    maxY: 100,
                    minY: 70,
                    showArea: true,
                    unit: "%",)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
