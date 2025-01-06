import 'package:financial_report_app/features/metrics/presentation/manager/get_matric_data_cubit/get_matric_data_cubit.dart';
import 'package:financial_report_app/features/metrics/presentation/manager/get_matric_data_cubit/get_matric_data_states.dart';
import 'package:financial_report_app/features/metrics/presentation/ui/widgets/metric_data_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MetricsView extends StatelessWidget {
  const MetricsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<GetMetricDataCubit,GetMetricDataState>(
          builder: (context,state) {
            if(state.state == GetMetricDataStateEnum.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state.state == GetMetricDataStateEnum.success) {
              return MetricDataList(
                data: state.data ?? [],
              );
            }
            if(state.state == GetMetricDataStateEnum.error) {
              return Center(
                child: Text(state.message!),
              );
            }
            return const SizedBox();
          }
        ),
      ),
    );
  }
}
