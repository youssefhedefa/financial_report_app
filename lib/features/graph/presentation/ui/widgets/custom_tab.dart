import 'package:financial_report_app/core/helper/app_text_style.dart';
import 'package:flutter/material.dart';


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
