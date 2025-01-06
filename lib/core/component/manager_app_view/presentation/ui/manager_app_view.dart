import 'package:financial_report_app/core/component/widgets/custom_bottom_nav_bar.dart';
import 'package:financial_report_app/features/metrics/presentation/metrics_view.dart';
import 'package:flutter/material.dart';

class ManagerAppView extends StatefulWidget {
  const ManagerAppView({super.key});

  @override
  State<ManagerAppView> createState() => _ManagerAppViewState();
}

class _ManagerAppViewState extends State<ManagerAppView> {
  int _selectedIndex = 0;
  List<Widget> views = [
    const MetricsView(),
    const Center(child: Text('Chart View')),
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
