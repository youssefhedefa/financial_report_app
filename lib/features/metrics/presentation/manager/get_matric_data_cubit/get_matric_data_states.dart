import 'package:financial_report_app/features/metrics/domain/entity/metric_entity.dart';

enum GetMetricDataStateEnum { initial, loading, success, error }

class GetMetricDataState{
  GetMetricDataStateEnum state;
  List<MetricEntity>? data;
  String? message;

  GetMetricDataState({required this.state, this.data, this.message});


  GetMetricDataState copyWith({
    GetMetricDataStateEnum? state,
    List<MetricEntity>? data,
    String? message,
  }) {
    return GetMetricDataState(
      state: state ?? this.state,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

 }