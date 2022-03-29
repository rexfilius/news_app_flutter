import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app_lib.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NewsItemList();
  }
}
