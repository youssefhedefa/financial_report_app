import 'package:financial_report_app/core/helper/app_text_style.dart';
import 'package:financial_report_app/features/graph/presentation/manager/graph_cubit/graph_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        if (index == 0) {
          context.read<GraphCubit>().fetchChartDataForDay();
        } else {
          context.read<GraphCubit>().fetchChartDataForMonth();
        }
      },
      controller: TabController(
        length: 2,
        vsync: Scaffold.of(context),
      ),
      tabs: const [
        CustomTab(title: 'Day'),
        CustomTab(title: 'Month'),
      ],
    );
  }
}


class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            title,
            style: AppTextStyle.font20BlackRegular,
        ),
    );
  }
}
