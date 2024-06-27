import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override

  /// Builds the home page of the app.
  ///
  /// This widget builds a [Scaffold] with a [LineChart] that displays the price
  /// history data provided by the [PriceHistoryProvider]. It also includes a
  /// dropdown menu to select the update interval for the chart.
  Widget build(BuildContext context) {
    // Get the price history provider from the nearest [PriceHistoryProvider]
    // ancestor widget in the widget tree.
    final provider = Provider.of<PriceHistoryProvider>(context);

    // Get the price history data from the provider.
    final priceHistory = provider.priceHistory;

    // Build the home page widget.
    return Scaffold(
      appBar: AppBar(title: const Text('Price History')),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Expanded(
                // Build the line chart widget.
                child: LineChart(
              LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: 1,
                    verticalInterval: 1,
                    getDrawingHorizontalLine: (value) {
                      return const FlLine(
                        color: Colors.white10,
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return const FlLine(
                        color: Colors.white10,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      dotData: const FlDotData(show: true),
                      spots: priceHistory
                          .map((data) => FlSpot(data["day"]!, data["price"]!))
                          .toList(),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 45,
                        getTitlesWidget: (value, meta) {
                          // Build the widget for the bottom axis titles.
                          return Text('${value.toInt()}');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 80,
                            getTitlesWidget: (value, meta) {
                              // Build the widget for the left axis titles.
                              return Text('\$$value');
                            })),
                  ),
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (touchedSpots) {
                        // Build the tooltip items for the line chart.
                        return touchedSpots.map((spot) {
                          return LineTooltipItem(
                            '${spot.y}',
                            const TextStyle(color: Colors.white),
                          );
                        }).toList();
                      },
                    ),
                    handleBuiltInTouches: true,
                  )),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.circle, color: Colors.blue),
                  const SizedBox(width: 8.0),
                  // Build the dropdown menu widget.
                  DropdownButton<String>(
                    value: '1 hour',
                    items: const [
                      DropdownMenuItem(
                        value: '1 hour',
                        child: Text('1 hour'),
                      ),
                      DropdownMenuItem(
                        value: '5 mins',
                        child: Text('5 mins'),
                      ),
                      DropdownMenuItem(
                        value: '1 min',
                        child: Text('1 min'),
                      ),
                      DropdownMenuItem(
                        value: '1 sec',
                        child: Text('1 sec'),
                      ),
                    ],
                    onChanged: (value) {
                      // Update the chart's update interval based on the
                      // selected value.
                      switch (value) {
                        case "1 hour":
                          provider.updateInterval(const Duration(hours: 1));
                          break;
                        case "5 mins":
                          provider.updateInterval(const Duration(minutes: 5));
                          break;
                        case "1 min":
                          provider.updateInterval(const Duration(minutes: 1));
                          break;
                        case "1 sec":
                          provider.updateInterval(const Duration(seconds: 1));
                          break;
                        default:
                          provider.updateInterval(const Duration(hours: 1));
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
