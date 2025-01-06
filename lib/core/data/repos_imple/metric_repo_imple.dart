import 'package:financial_report_app/core/data/data_source/orders_data_source.dart';
import 'package:financial_report_app/core/data/model/orders_model.dart';
import 'package:financial_report_app/features/metrics/domain/entity/metric_entity.dart';
import 'package:financial_report_app/features/metrics/domain/repo/metric_repo.dart';

class MetricRepoImple extends MetricRepo {
  final OrdersDataSource ordersDataSource;

  MetricRepoImple({required this.ordersDataSource});
  @override
  Future<List<MetricEntity>> getMetricData() async{
    List<OrderModel> orders = await ordersDataSource.fetchOrders();
    if(orders.isNotEmpty){
      final int totalOrders = orders.length;
      final num totalOrderPrice = orders.map((order) {
        String priceString = order.price.replaceAll('\$', '').replaceAll(',', '');
        num price = num.parse(priceString);
        return price;
      }).reduce((value, element) => value + element);
      final num averageOrderPrice = totalOrderPrice / totalOrders;
      final int totalReturnedOrders = orders.where((order) => order.status == 'RETURNED').length;
      return [
        MetricEntity(name: 'Total Orders', value: totalOrders.toDouble()),
        MetricEntity(name: 'Average order price', value: averageOrderPrice),
        MetricEntity(name: 'Total number of returned orders', value: totalReturnedOrders.toDouble()),
      ];
    }
    return[];
  }
}