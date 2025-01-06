import 'dart:developer';
import 'package:financial_report_app/core/data/data_source/orders_data_source.dart';
import 'package:financial_report_app/features/graph/domain/entity/chart_entity.dart';
import 'package:financial_report_app/features/graph/domain/repo/graph_repo.dart';

class GraphRepoImple implements GraphRepo {
  final OrdersDataSource ordersDataSource;

  GraphRepoImple({required this.ordersDataSource});

  @override
  Future<List<ChartEntity>> fetchDayChartData() async {
    final orders = await ordersDataSource.fetchOrders();
    List<ChartEntity> chartData = [];
    Map<String, int> ordersPerDay = {};
    for (var order in orders){
      String dataKey = order.registered.toString().split(' ')[0];
      log(dataKey);
      if(ordersPerDay.containsKey(dataKey)){
        ordersPerDay[dataKey] = ordersPerDay[dataKey]! + 1;
      }else{
        ordersPerDay[dataKey] = 1;
      }
    }
    ordersPerDay = Map.fromEntries(ordersPerDay.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
    ordersPerDay.forEach((key, value) {
      chartData.add(ChartEntity(numberOfOrders: value, month: key));
    });
    return chartData;
  }

  @override
  Future<List<ChartEntity>> fetchMonthChartData() async{
    final orders = await ordersDataSource.fetchOrders();
    List<ChartEntity> chartData = [];
    Map<String, int> ordersPerMonth = {};
    for (var order in orders){
      String dataKey = order.registered.toString().split(' ')[0];
      dataKey = dataKey.split('-')[1];
      log(dataKey);
      if(ordersPerMonth.containsKey(dataKey)){
        ordersPerMonth[dataKey] = ordersPerMonth[dataKey]! + 1;
      }else{
        ordersPerMonth[dataKey] = 1;
      }
    }
    ordersPerMonth = Map.fromEntries(ordersPerMonth.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
    ordersPerMonth.forEach((key, value) {
      chartData.add(ChartEntity(numberOfOrders: value, month: key));
    });
    return chartData;
  }
}
