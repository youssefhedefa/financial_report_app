import 'package:financial_report_app/features/graph/domain/entity/chart_entity.dart';

abstract class GraphRepo {
  Future<List<ChartEntity>> fetchChartData();
}