import 'package:flutter/material.dart';

import '../constants/color.dart';

class Option extends StatelessWidget {
  final String label;
  final bool isSelected;
  VoidCallback? onTap = (){};

  Option({
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    return Container(
      margin: EdgeInsets.only(top: 16, right: 4),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? colors.primaryColor : colors.secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? colors.textPrimaryColor : colors.textSecondaryColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
