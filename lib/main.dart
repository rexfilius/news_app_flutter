import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app_flutter/news_app_lib.dart';

void main() {
  runApp(const News());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.black,
    systemNavigationBarColor: AppColors.black,
  ));
}

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRoutesMap,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}
