import 'package:financial_report_app/features/graph/domain/entity/chart_entity.dart';

enum GraphStatesEnum { initial, loading, success, error }

class GraphState {
  final GraphStatesEnum state;
  final String? message;
  final List<ChartEntity>? data;
  final bool? isDay;

  GraphState({required this.state, this.message, this.data, this.isDay});

  GraphState copyWith({
    GraphStatesEnum? state,
    String? message,
    List<ChartEntity>? data,
    bool? isDay,
  }) {
    return GraphState(
        state: state ?? this.state,
        message: message ?? this.message,
        data: data ?? this.data,
        isDay: isDay ?? this.isDay
    );
  }
}
