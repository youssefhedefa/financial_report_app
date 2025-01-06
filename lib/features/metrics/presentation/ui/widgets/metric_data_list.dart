import 'package:financial_report_app/features/metrics/domain/entity/metric_entity.dart';
import 'package:financial_report_app/features/metrics/presentation/ui/widgets/metric_item.dart';
import 'package:flutter/material.dart';

class MetricDataList extends StatelessWidget {
  const MetricDataList({super.key, required this.data});

  final List<MetricEntity> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return MetricItem(
          title: data[index].name,
          value: adjustValue(data[index].value.toString()),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemCount: data.length,
    );
  }
  adjustValue(String value) {
    double val = double.parse(value);
    if (val.toStringAsFixed(2).split(".")[1] == "00") {
      return val.toStringAsFixed(0);
    }
    return val.toStringAsFixed(2);
  }
}
