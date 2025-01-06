import 'dart:developer';

import 'package:financial_report_app/features/graph/domain/repo/graph_repo.dart';
import 'package:financial_report_app/features/graph/presentation/manager/graph_cubit/graph_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphCubit extends Cubit<GraphState> {
  GraphCubit(this._graphRepo)
      : super(GraphState(state: GraphStatesEnum.initial,isDay: true));
  final GraphRepo _graphRepo;

  void fetchChartDataForDay() async {
    emit(GraphState(state: GraphStatesEnum.loading));
    try {
      final data = await _graphRepo.fetchDayChartData();
      emit(
        GraphState(
          state: GraphStatesEnum.success,
          data: data,
          isDay: true,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(GraphState(state: GraphStatesEnum.error, message: e.toString()));
    }
  }

  void fetchChartDataForMonth() async {
    emit(GraphState(state: GraphStatesEnum.loading));
    try {
      final data = await _graphRepo.fetchMonthChartData();
      emit(
        GraphState(
          state: GraphStatesEnum.success,
          data: data,
          isDay: false,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(GraphState(state: GraphStatesEnum.error, message: e.toString()));
    }
  }
}
