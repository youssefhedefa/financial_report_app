import 'package:financial_report_app/core/component/functions/adjust_value_function.dart';
import 'package:financial_report_app/features/metrics/domain/entity/metric_entity.dart';
import 'package:financial_report_app/features/metrics/presentation/ui/widgets/metric_item.dart';
import 'package:flutter/material.dart';

class WebListView extends StatelessWidget {
  const WebListView({super.key, required this.data, required this.crossAxisCount});
  final List<MetricEntity> data;
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return MetricItem(
          title: data[index].name,
          value: adjustValue(data[index].value.toString()),
        );
      },
      itemCount: data.length,
    );
  }
}
