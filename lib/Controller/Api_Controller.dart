import 'package:db_miner/helper/Api_helper.dart';
import 'package:flutter/material.dart';

import '../modal/Api_modal.dart';

class QuotesController extends ChangeNotifier {
  List<Quotes> allQuotes = [];

  QuotesController() {
    loadData();
  }

  Future<void> loadData() async {
    allQuotes = await APiCalling.aPiCalling.getQuotesData();
    notifyListeners();
  }
}
