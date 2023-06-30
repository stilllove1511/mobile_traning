import 'package:flutter/material.dart';

import '../constants/color.dart';

class AppSearchBar extends StatefulWidget {
  AppSearchBar({super.key, this.onSearch});
  ValueChanged<String>? onSearch = (String key) {};

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    return TextField(
      style: TextStyle(
        color: colors.textPrimaryColor
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        hintText: 'Xem khuyến nghị theo mã',
        hintStyle: TextStyle(
            color: colors.textSecondaryColor, fontSize: 16, height: 22 / 16),
        suffixIcon: Icon(
          Icons.search,
          color: Color(0xFF4F4F4F),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        //change backgroundColor of TextField
        filled: true,
        fillColor: colors.secondaryBackgroundColor,
      ),
      onChanged: widget.onSearch,
    );
  }
}
