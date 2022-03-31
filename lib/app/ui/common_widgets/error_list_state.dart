import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app_lib.dart';

class ErrorListState extends StatelessWidget {
  const ErrorListState({
    required this.snapshot,
    Key? key,
  }) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Oops! An error occurred. ${snapshot.error.toString()}',
        style: AppStyles.newsCardText1,
      ),
    );
  }
}
