import 'package:financial_report_app/core/helper/app_color_helper.dart';
import 'package:financial_report_app/core/helper/app_text_style.dart';
import 'package:flutter/material.dart';

class MetricItem extends StatelessWidget {
  const MetricItem({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColorHelper.greenColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.font32BlackSemiBold,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            value,
            style: AppTextStyle.font28BlackRegular,
          ),
        ],
      ),
    );
  }
}
