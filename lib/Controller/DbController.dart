import 'package:db_miner/modal/Api_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import '../helper/quotes_data_helper.dart';

class DbController extends ChangeNotifier {
  List<Quotes> allLikeQuotesData = [];

  Logger logger = Logger();

  DbController() {
    initData();
  }

  Future<void> initData() async {
    DbHelper.dbHelper.initDb();
    allLikeQuotesData = await DbHelper.dbHelper.getAllData();
    print(allLikeQuotesData[0].text);
    notifyListeners();
  }

  void insertData({required Quotes quotes, required String image}) {
    DbHelper.dbHelper.insertData(quotes: quotes, image: image);
    logger.i(allLikeQuotesData);
    initData();
  }
}
