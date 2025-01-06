import 'package:financial_report_app/features/graph/domain/entity/chart_entity.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphBody extends StatelessWidget {
  const GraphBody({super.key, required this.data, required this.isDay});

  final List<ChartEntity> data;
  final bool isDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        vertical: 80
      ),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(
          text: 'Orders per ${isDay ? 'day': 'month'} in 2021',
        ),
        primaryXAxis: CategoryAxis(
          labelIntersectAction: AxisLabelIntersectAction.rotate45,
          title: AxisTitle(text: isDay ? 'Days': 'Months'),
          axisLine: const AxisLine(width: 2),
          majorTickLines: const MajorTickLines(size: 0),
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: isDay ? 5 : 20,
          interval: 1,
          labelFormat: '{value}',
          title: const AxisTitle(text: 'Number of orders'),
          axisLine: const AxisLine(width: 2),
          majorTickLines: const MajorTickLines(size: 0),
        ),
        series: _buildLineSeries(),
        trackballBehavior: TrackballBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          tooltipSettings: const InteractiveTooltip(format: 'point.x : point.y'),
        ),
      ),
    );
  }

  List<LineSeries<ChartEntity, String>> _buildLineSeries() {
    if (data.isNotEmpty) {
      return [
        LineSeries<ChartEntity, String>(
          dataSource: data,
          xValueMapper: (ChartEntity entity, _) => entity.month,
          yValueMapper: (ChartEntity entity, _) => entity.numberOfOrders,
          name: 'Orders',
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        )
      ];
    }
    return [];
  }
}