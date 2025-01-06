import 'dart:convert';

import 'package:financial_report_app/core/data/model/orders_model.dart';
import 'package:flutter/services.dart';

class OrdersDataSource {
  final String ordersJsonPath = 'assets/json/orders.json';
  Future<List<OrderModel>> fetchOrders() async {
    final String response = await rootBundle.loadString(ordersJsonPath);
    final List<dynamic> jsonList = jsonDecode(response);
    final List<OrderModel> orders =
        jsonList.map((json) => OrderModel.fromJson(json)).toList();
    return orders;
  }
}
