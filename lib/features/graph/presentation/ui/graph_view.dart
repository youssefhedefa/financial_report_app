import 'package:financial_report_app/features/graph/presentation/manager/graph_cubit/graph_cubit.dart';
import 'package:financial_report_app/features/graph/presentation/manager/graph_cubit/graph_states.dart';
import 'package:financial_report_app/features/graph/presentation/ui/widgets/custom_tab_bar.dart';
import 'package:financial_report_app/features/graph/presentation/ui/widgets/graph_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphView extends StatelessWidget {
  const GraphView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomTabBar(),
          BlocBuilder<GraphCubit, GraphState>(
            builder: (context, state) {
              if (state.state == GraphStatesEnum.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.state == GraphStatesEnum.success) {
                return Center(
                  child: GraphBody(
                    data: state.data ?? [],
                    isDay: state.isDay ?? true,
                  ),
                );
              } else if (state.state == GraphStatesEnum.error) {
                return Center(
                  child: Text(state.message ?? 'Error'),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
