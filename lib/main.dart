import 'package:flutter/material.dart';
import 'package:mobile_traning/screen/detail.dart';
import 'package:mobile_traning/screen/home.dart';
import 'package:mobile_traning/screen/mutation.dart';

import 'constants/color.dart';

void main() {
  print('app is running');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    return MaterialApp(
      title: 'Moble Tranning',
      theme: ThemeData(
        scaffoldBackgroundColor:
            colors.backgroundColor, // Đặt màu nền cho Scaffold
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color:
                colors.textPrimaryColor, // Đặt màu chữ mặc định thành màu trắng
            fontSize: 14,
            height: 20 / 14,
            fontFamily: 'Inter'
          ),
        ),
      ),
      home: const Home(),
    );
  }
}
