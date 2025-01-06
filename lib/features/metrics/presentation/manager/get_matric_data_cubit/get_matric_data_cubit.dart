import 'package:financial_report_app/features/metrics/domain/repo/metric_repo.dart';
import 'package:financial_report_app/features/metrics/presentation/manager/get_matric_data_cubit/get_matric_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMetricDataCubit extends Cubit<GetMetricDataState> {
  GetMetricDataCubit(this._metricRepo)
      : super(GetMetricDataState(state: GetMetricDataStateEnum.initial));
  final MetricRepo _metricRepo;

  void getMetricData() async {
    emit(GetMetricDataState(state: GetMetricDataStateEnum.loading));
    try {
      // Simulate network delay
      Future.delayed(const Duration(seconds: 2), () async {
        final data = await _metricRepo.getMetricData();
        emit(
          GetMetricDataState(
            state: GetMetricDataStateEnum.success,
            data: data,
          ),
        );
      });
    } catch (e) {
      emit(
        GetMetricDataState(
          state: GetMetricDataStateEnum.error,
          message: e.toString(),
        ),
      );
    }
  }
}
