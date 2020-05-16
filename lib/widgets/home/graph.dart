import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 300, 30, 0),
      child: AspectRatio(
        aspectRatio: 1.23,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Weekly Summary',
                    style: TextStyle(
                        color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                      child: LineChart(
                        sampleData2(context),
                        swapAnimationDuration:
                            const Duration(milliseconds: 250),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  LineChartData sampleData2(BuildContext context) {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
      ),
      gridData: FlGridData(
        show: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 18,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          margin: 5,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Lun';
              case 2:
                return 'Mar';
              case 3:
                return 'Mie';
              case 4:
                return 'Jue';
              case 5:
                return 'Vie';
              case 6:
                return 'Sab';
              case 7:
                return 'Dom';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),

      maxX: 7,
      lineBarsData: linesBarData2(context),
    );
  }

  List<LineChartBarData> linesBarData2(BuildContext context) {
    return [
      LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(2, 2.8),
          FlSpot(3, 1.2),
          FlSpot(4, 2.8),
          FlSpot(5, 2.6),
          FlSpot(6, 3.9),
          FlSpot(7, 2),
        ],
        isCurved: true,
        colors: const [
          Colors.transparent,
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          Theme.of(context).primaryColor
        ]),
      ),
    ];
  }
}
