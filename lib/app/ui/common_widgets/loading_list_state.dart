import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app_lib.dart';

class LoadingListState extends StatelessWidget {
  const LoadingListState({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        message,
        style: AppStyles.newsCardText1,
      ),
    );
  }
}
