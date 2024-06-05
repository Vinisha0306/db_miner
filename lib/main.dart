import 'package:db_miner/Controller/Api_Controller.dart';
import 'package:db_miner/Controller/DbController.dart';
import 'package:db_miner/Controller/themeController.dart';
import 'package:db_miner/Controller/wallpaperController.dart';
import 'package:db_miner/helper/quotes_data_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DbHelper.dbHelper.initDb();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuotesController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DbController(),
        ),
        ChangeNotifierProvider(
          create: (context) => WallPaperController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
