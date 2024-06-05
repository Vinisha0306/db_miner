import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/Api_modal.dart';

class APiCalling {
  APiCalling._();

  static APiCalling aPiCalling = APiCalling._();

  String QuotesApi =
      "https://famous-quotes4.p.rapidapi.com/random?category=all&count=2000";

  Future<List<Quotes>> getQuotesData() async {
    List<Quotes> allQuotes = [];

    http.Response response = await http.get(Uri.parse(QuotesApi), headers: {
      'x-rapidapi-key': '560709b69amsh10452e5f1d2a5e5p1a1a09jsn3d6027f9e6cb',
      'x-rapidapi-host': 'famous-quotes4.p.rapidapi.com',
    });

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      allQuotes = data.map((e) => Quotes.fromJson(e)).toList();
    }

    return allQuotes;
  }
}
