import 'package:financial_report_app/features/metrics/presentation/ui/widgets/metric_item.dart';
import 'package:flutter/material.dart';

class MetricsView extends StatelessWidget {
  const MetricsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return const MetricItem(
              title: 'Total Orders',
              value: '1000',
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}
