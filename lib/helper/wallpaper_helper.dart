import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modal/wallpaper_modal.dart';

class WallPaperApi {
  WallPaperApi._();

  static WallPaperApi wallPaperApi = WallPaperApi._();

  String api =
      "https://pixabay.com/api/?key=43147754-7be605e9af5bfcca0a0db3dbe&orientation=vertical";

  Future<List<WallPaper>> getWallPaper() async {
    List<WallPaper> allWallPaper = [];

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List allData = data['hits'];
      allWallPaper = allData.map((e) => WallPaper.fromJson(e)).toList();
    }
    print("print : ${response.statusCode}");
    return allWallPaper;
  }
}
