import 'package:financial_report_app/core/component/widgets/custom_bottom_nav_bar.dart';
import 'package:financial_report_app/core/di/di.dart';
import 'package:financial_report_app/features/graph/presentation/manager/graph_cubit/graph_cubit.dart';
import 'package:financial_report_app/features/graph/presentation/ui/graph_view.dart';
import 'package:financial_report_app/features/metrics/presentation/manager/get_matric_data_cubit/get_matric_data_cubit.dart';
import 'package:financial_report_app/features/metrics/presentation/ui/metrics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManagerAppView extends StatefulWidget {
  const ManagerAppView({super.key});

  @override
  State<ManagerAppView> createState() => _ManagerAppViewState();
}

class _ManagerAppViewState extends State<ManagerAppView> {
  int _selectedIndex = 0;
  List<Widget> views = [
    BlocProvider(
      create: (context) => getIt<GetMetricDataCubit>()..getMetricData(),
        child: const MetricsView(),
    ),
    BlocProvider(
      create: (context) => getIt<GraphCubit>()..fetchChartDataForDay(),
        child: const GraphView(),
    ),
  ];

  changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          views[_selectedIndex],
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: CustomBottomNavBar(
              onTap: changeIndex,
              currentIndex: _selectedIndex,
            ),
          )
        ],
      ),
    );
  }
}
