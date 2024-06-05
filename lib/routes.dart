import 'package:db_miner/pages/details_page/details_page.dart';
import 'package:db_miner/pages/homePage/home_page.dart';
import 'package:db_miner/pages/like_page/like_page.dart';
import 'package:db_miner/pages/spleshScreen/spleshScreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String homePage = 'home_page';
  static String detailPage = 'detail_page';
  static String likePage = 'like_page';
  static String spleshScreen = '/';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.homePage: (context) => HomePage(),
    AppRoutes.spleshScreen: (context) => SpleshScreen(),
    AppRoutes.detailPage: (context) => DetailsPage(),
    AppRoutes.likePage: (context) => LikePage(),
  };
}
