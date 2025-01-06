import 'package:financial_report_app/features/metrics/domain/entity/metric_entity.dart';

abstract class MetricRepo {
  Future<List<MetricEntity>> getMetricData();
}