import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../data/model/movie_detail_model.dart';
import '../../../data/model/movie_model.dart';
import '../repository/home_repository.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  TextEditingController searchController = TextEditingController();
  RxString searchValue = ''.obs;
  RxBool isMovieNetworkLoading = false.obs;
  Rx<List<MovieModel>> allMovieList = Rx([]);
  Rx<List<MovieModel>> topRatedMovieList = Rx([]);
  Rx<List<MovieModel>> upcomingMovieList = Rx([]);
  Rx<List<MovieModel>> popularMovieList = Rx([]);
  Rx<List<MovieModel>> trendingMovieList = Rx([]);
  Rx<List<MovieModel>> searchMovieList = Rx([]);
  var movieDetail = MovieDetailModel().obs;

  @override
  void onInit() {
    super.onInit();
    getAllMovieList();
    getTopRatedMovieList();
    getUpcomingMovieList();
    getPopularMovieList();
    getTrendingMovieList();

  }

  Future<void> getAllMovieList() async {

    isMovieNetworkLoading.value = true;
    try {
      await HomeRepository().fetchMovieList('discover/movie').then((result) async {

        allMovieList.value = result!;

        isMovieNetworkLoading.value = false;

      }).catchError((error) {
        isMovieNetworkLoading.value = false;
        debugPrint(" catchError $error");
      });
    } on HttpException {
      debugPrint("catchError");
    } finally {
      isMovieNetworkLoading.value = false;
    }
  }
  Future<void> getTopRatedMovieList() async {

    isMovieNetworkLoading.value = true;
    try {
      await HomeRepository().fetchMovieList('movie/top_rated').then((result) async {

        topRatedMovieList.value = result!;

        isMovieNetworkLoading.value = false;

      }).catchError((error) {
        isMovieNetworkLoading.value = false;
        debugPrint(" catchError $error");
      });
    } on HttpException {
      debugPrint("catchError");
    } finally {
      isMovieNetworkLoading.value = false;
    }
  }
  Future<void> getUpcomingMovieList() async {

    isMovieNetworkLoading.value = true;
    try {
      await HomeRepository().fetchMovieList('movie/upcoming').then((result) async {

        upcomingMovieList.value = result!;

        isMovieNetworkLoading.value = false;

      }).catchError((error) {
        isMovieNetworkLoading.value = false;
        debugPrint(" catchError $error");
      });
    } on HttpException {
      debugPrint("catchError");
    } finally {
      isMovieNetworkLoading.value = false;
    }
  }
  Future<void> getPopularMovieList() async {

    isMovieNetworkLoading.value = true;
    try {
      await HomeRepository().fetchMovieList('movie/popular').then((result) async {

        popularMovieList.value = result!;

        isMovieNetworkLoading.value = false;

      }).catchError((error) {
        isMovieNetworkLoading.value = false;
        debugPrint(" catchError $error");
      });
    } on HttpException {
      debugPrint("catchError");
    } finally {
      isMovieNetworkLoading.value = false;
    }
  }
  Future<void> getTrendingMovieList() async {

    isMovieNetworkLoading.value = true;
    try {
      await HomeRepository().fetchMovieList('trending/movie/day').then((result) async {

        trendingMovieList.value = result!;

        isMovieNetworkLoading.value = false;

      }).catchError((error) {
        isMovieNetworkLoading.value = false;
        debugPrint(" catchError $error");
      });
    } on HttpException {
      debugPrint("catchError");
    } finally {
      isMovieNetworkLoading.value = false;
    }
  }
  Future<void> getSearchMovieList() async {

    isMovieNetworkLoading.value = true;
    try {
      await HomeRepository().fetchSearchList('search/movie',searchController.text).then((result) async {

        searchMovieList.value = result!;

        isMovieNetworkLoading.value = false;

      }).catchError((error) {
        isMovieNetworkLoading.value = false;
        debugPrint(" catchError $error");
      });
    } on HttpException {
      debugPrint("catchError");
    } finally {
      isMovieNetworkLoading.value = false;
    }
  }

  Future<void> getMovieDetail(String movieId) async {

    isMovieNetworkLoading.value = true;
    try {
      await HomeRepository().fetchMovieDetail('movie/$movieId').then((result) async {

        movieDetail.value = result!;

        isMovieNetworkLoading.value = false;

      }).catchError((error) {
        isMovieNetworkLoading.value = false;
        debugPrint(" catchError $error");
      });
    } on HttpException {
      debugPrint("catchError");
    } finally {
      isMovieNetworkLoading.value = false;
    }
  }




}
