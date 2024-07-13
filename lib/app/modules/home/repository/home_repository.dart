import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;

import '../../../data/model/movie_detail_model.dart';
import '../../../data/model/movie_model.dart';
import '../../../util/app_constant.dart';

class HomeRepository extends GetConnect{

  Future<List<MovieModel>?> fetchMovieList(String endPoint) async {

    List<MovieModel> movieList = [];

    final url = Uri.parse('${BASE_URL}$endPoint?api_key=${API_KEY}');
    var response = await http.get(
        url,

    );


    debugPrint("status code....."+response.statusCode.toString());
    debugPrint('log me'+response.body);


    if (response.statusCode == 200) {
      debugPrint("log me ....."+response.body);
      var jsonResponse = jsonDecode(response.body);
      movieList = (((jsonResponse as Map<String, dynamic>)['results']) as List)
          .map((element) => MovieModel.fromJson(element))
          .toList();
      return movieList;
    } else if (response.statusCode == 400) {
      throw const HttpException('Error');
    } else {
      throw const HttpException('Error');
    }
  }

  Future<List<MovieModel>?> fetchSearchList(String endPoint,String searchText) async {

    List<MovieModel> movieList = [];

    final url = Uri.parse('${BASE_URL}$endPoint?query=$searchText&api_key=${API_KEY}');
    var response = await http.get(
      url,

    );


    debugPrint("status code....."+response.statusCode.toString());
    debugPrint('log me'+response.body);


    if (response.statusCode == 200) {
      debugPrint("log me ....."+response.body);
      var jsonResponse = jsonDecode(response.body);
      movieList = (((jsonResponse as Map<String, dynamic>)['results']) as List)
          .map((element) => MovieModel.fromJson(element))
          .toList();
      return movieList;
    } else if (response.statusCode == 400) {
      throw const HttpException('Error');
    } else {
      throw const HttpException('Error');
    }
  }

  Future<MovieDetailModel?> fetchMovieDetail(String endPoint) async {

    List<MovieModel> movieList = [];

    final url = Uri.parse('${BASE_URL}$endPoint?api_key=${API_KEY}');
    var response = await http.get(
      url,

    );


    debugPrint("status code....."+response.statusCode.toString());
    debugPrint('log me'+response.body);


    if (response.statusCode == 200) {
      debugPrint("log me ....."+response.body);
      var jsonResponse = jsonDecode(response.body);
      return MovieDetailModel.fromJson(jsonResponse as Map<String, dynamic> );
    } else if (response.statusCode == 400) {
      throw const HttpException('Error');
    } else {
      throw const HttpException('Error');
    }
  }

}