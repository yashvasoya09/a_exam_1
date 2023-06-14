import 'dart:convert';
import 'package:a_exam_1/screen/Model/search_model.dart';
import 'package:http/http.dart' as http;
class apiHelper
{
  static apiHelper apihelper = apiHelper();
  Future<EModel> api_helper()
  async {
    String? link='https://real-time-product-search.p.rapidapi.com/search?q=Nike%20shoes&country=us&language=en';
    var responce = await http.get(Uri.parse(link),headers: {"X-RapidAPI-Key": "7586c629f9mshef97ea44d4f648bp1f20d0jsn90c1c827dd3f", "X-RapidAPI-Host": "real-time-product-search.p.rapidapi.com"});
    var Json = jsonDecode(responce.body);
     // print(Json);
    return  EModel.fromJson(Json);
  }
}