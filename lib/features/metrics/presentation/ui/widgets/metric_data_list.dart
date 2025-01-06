import 'package:financial_report_app/features/metrics/domain/entity/metric_entity.dart';
import 'package:financial_report_app/features/metrics/presentation/ui/widgets/mobile_list_view.dart';
import 'package:financial_report_app/features/metrics/presentation/ui/widgets/web_list_view.dart';
import 'package:flutter/material.dart';

class MetricDataList extends StatelessWidget {
  const MetricDataList({super.key, required this.data});

  final List<MetricEntity> data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints.maxWidth);
      if (constraints.maxWidth > 600) {
        if (constraints.maxWidth < 860) {
          return WebListView(
            data: data,
            crossAxisCount: 2,
          );
        }
        return WebListView(
          data: data,
          crossAxisCount: 3,
        );
      }
      return MobileListView(
        data: data,
      );
    });
  }
}
