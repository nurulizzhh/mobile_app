import 'dart:convert';
import 'package:http/http.dart';

class HttpService {
  Future<Map> getDatasCategory() async {
    Response response = await get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
    Map datasResult = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(datasResult);
      return datasResult;
    } else {
      print("Error: " + response.statusCode.toString());
      return datasResult;
    }
  }

  Future<Map> getDatabyCategory(String category) async {
    Response response = await get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category"));
    Map datasResult = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(datasResult);
      return datasResult;
    } else {
      print("Error: " + response.statusCode.toString());
      return datasResult;
    }
  }

  Future<Map> getDetail(String detail) async {
    Response response = await get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/search.php?s=$detail"));
    Map dataResult = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return dataResult; // Mengembalikan seluruh data dari API
    } else {
      print("Error: " + response.statusCode.toString());
      throw Exception("Failed to load details");
    }
  }

  Future<Map> getSearch(String detail) async {
    Response response = await get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/search.php?s=$detail"));
    Map datasResult = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(datasResult);
      return datasResult;
    } else {
      print("Error: " + response.statusCode.toString());
      return datasResult;
    }
  }

  Future<Map> getRecommended() async {
    Response response = await get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?f=b"));
    Map datasResult = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(datasResult);
      return datasResult;
    } else {
      print("Error: " + response.statusCode.toString());
      return datasResult;
    }
  }
}
