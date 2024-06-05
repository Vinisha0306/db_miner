import 'package:flutter/material.dart';
import '../helper/wallpaper_helper.dart';
import '../modal/wallpaper_modal.dart';

class WallPaperController extends ChangeNotifier {
  List<WallPaper> allWallPaper = [];
  String image =
      'https://i.pinimg.com/564x/50/d5/f4/50d5f4e6d5656c0bbc57c0c32e90b6b5.jpg';

  WallPaperController() {
    loadData();
  }

  Future<void> loadData() async {
    allWallPaper = await WallPaperApi.wallPaperApi.getWallPaper();
    notifyListeners();
  }

  void getImage({required index}) {
    image = allWallPaper[index].largeImageUrl;
    notifyListeners();
  }
}
