import 'package:financial_report_app/core/helper/app_color_helper.dart';
import 'package:flutter/material.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.onTap, required this.currentIndex});

  final Function(int) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              label: 'Chart',
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: AppColorHelper.yellowColor,
          unselectedItemColor: Colors.grey,
          onTap: onTap,
        ),
      ),
    );
  }
}
