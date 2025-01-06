import 'dart:developer';

import 'package:financial_report_app/core/data/data_source/orders_data_source.dart';
import 'package:financial_report_app/features/graph/domain/entity/chart_entity.dart';
import 'package:financial_report_app/features/graph/domain/repo/graph_repo.dart';

class GraphRepoImple implements GraphRepo {
  final OrdersDataSource ordersDataSource;

  GraphRepoImple({required this.ordersDataSource});
  @override
  Future<List<ChartEntity>> fetchChartData() async {
    final orders = await ordersDataSource.fetchOrders();
    List<ChartEntity> chartData = [];
    Map<String, int> ordersPerDay = {};
    for (var order in orders){
      String dataKey = order.registered.toString().split('T')[0];
      log(dataKey);
      if(ordersPerDay.containsKey(dataKey)){
        ordersPerDay[dataKey] = ordersPerDay[dataKey]! + 1;
      }else{
        ordersPerDay[dataKey] = 1;
      }
    }
    ordersPerDay.forEach((key, value) {
      chartData.add(ChartEntity(numberOfOrders: value, month: key));
    });
    return chartData;
  }
}
