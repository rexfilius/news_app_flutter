import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app_lib.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({Key? key}) : super(key: key);

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('All News Scree'));
  }
}
