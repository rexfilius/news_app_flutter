import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app_lib.dart';

Map<String, Widget Function(BuildContext)> appRoutesMap = {
  AppRoutes.allNewsScreen: (context) => const AllNewsScreen(),
  AppRoutes.favoriteNewsScreen: (context) => const FavoriteNewsScreen(),
};
