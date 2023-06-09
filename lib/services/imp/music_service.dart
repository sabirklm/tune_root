// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tuneroot_application/models/model.dart';
import 'package:tuneroot_application/services/dao/music_dao.dart';

class MusicService extends MusicDAO {
  String MUSIC_API = "http://172.20.10.2:8000/musics";
  String CATEGORIES_API = "http://172.20.10.2:8000/categories";
  @override
  Future<Map<String, dynamic>> getMusics() async {
    try {
      var uri = Uri.parse(MUSIC_API);
      var response = await http.get(uri);
      print(response.body);
      var data = jsonDecode(response.body);
      print(data is Map<String, dynamic>);
      return data;
    } catch (e) {
      return Future.error(
        ErrorResponse(
          errorMessage: "errorMessage $e",
          errorCode: 120,
        ),
      );
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    try {
      var uri = Uri.parse(CATEGORIES_API);
      var response = await http.get(uri);
      var resBody = jsonDecode(response.body) as List<dynamic>;
      return resBody.map((e) => Category.fromJson(e)).toList();
    } catch (e) {
      log("____errorOfCat $e");
      return Future.error(
        ErrorResponse(
          errorMessage: "errorMessage",
          errorCode: 120,
        ),
      );
    }
  }
}
