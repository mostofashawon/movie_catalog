import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:movie_catalog/app/data/model/movie_model.dart';
import 'package:movie_catalog/app/routes/app_pages.dart';
import 'package:movie_catalog/app/util/app_color.dart';
import 'package:movie_catalog/app/util/app_size.dart';

import '../../../components/grid_tile.dart';
import '../../../util/app_assets.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.040,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Find Movies , Tv Series \nand more...',
                  style: TextStyle(
                      fontSize: screenWidth * 0.07,fontWeight: FontWeight.bold,color: AppColors.textColor),
                ),
              ),
              SizedBox(height: screenHeight * 0.020,),
              Container(
                  height: 60,
                  width: screenWidth,
                  margin: const EdgeInsets.only(
                      left: 10,
                      right: 10
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.colorLightGrey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,top: 4.0),
                    child: TextFormField(
                      controller: controller.searchController,
                      style: const TextStyle(
                          color: AppColors.colorLightGrey,
                          fontSize: 18
                      ),
                      decoration: const InputDecoration(
                        hintText: "Search here ...",
                        hintStyle: TextStyle(
                            color: AppColors.colorLightGrey,
                            fontSize: 18
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        border: InputBorder.none,

                      ),
                      onChanged: (value){
                        controller.searchValue.value = value;
                        if(controller.searchValue.value .length > 1){
                          controller.getSearchMovieList();
                        }
                        else {
                          controller.getAllMovieList();
                          controller.getTopRatedMovieList();
                          controller.getUpcomingMovieList();
                          controller.getPopularMovieList();
                        }
                      },
                    ),
                  )

              ),

              Obx(() => controller.isMovieNetworkLoading.value == true ?
                Expanded(child: Center(child: CircularProgressIndicator(color: AppColors.colorLightGrey,))) : Expanded(
                child: DefaultTabController(length: 4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.070,
                        width: screenWidth,
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TabBar(
                            tabAlignment: TabAlignment.center,
                            indicatorSize: TabBarIndicatorSize.label,
                            dividerColor: Colors.transparent,
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.setectTabColor,
                              ),
                            ),
                            isScrollable: true,
                            labelStyle: TextStyle(
                              color:  AppColors.setectTabColor,
                            ),
                            unselectedLabelColor: AppColors.textColor,
                            tabs: [
                              Text(
                                "All",style: TextStyle(
                                  fontSize: 20
                              ),

                              ),
                              Text(
                                "Top Rated",style: TextStyle(
                                  fontSize: 20
                              ),

                              ),
                              Text(
                                "Upcoming",style: TextStyle(
                                  fontSize: 20
                              ),

                              ),
                              Text(
                                "Popular",style: TextStyle(
                                  fontSize: 20
                              ),

                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: TabBarView(children: [

                        RefreshIndicator(
                          color: AppColors.colorLightGrey,
                          onRefresh: () async {
                            controller.searchController.clear();
                            controller.searchValue.value = '';
                            controller.getAllMovieList();
                            controller.getTopRatedMovieList();
                            controller.getUpcomingMovieList();
                            controller.getPopularMovieList();
                          },
                          child: GridView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.searchValue.value.length > 1 ? controller.searchMovieList.value.length :controller.allMovieList.value.length ,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.9),
                            itemBuilder: (BuildContext context, int index) {
                              MovieModel model = controller.searchValue.value.length > 1 ? controller.searchMovieList.value[index] : controller.allMovieList.value[index] ;
                              return GridMovieTile(index: index,movieModel: model ,onTapDetail: (){
                                controller.getMovieDetail(model.id.toString());
                                Get.toNamed(Routes.DETAIL);
                              },);
                            },
                          ),
                        ),

                        RefreshIndicator(
                          color: AppColors.colorLightGrey,
                          onRefresh: () async {
                            controller.searchController.clear();
                            controller.searchValue.value = '';
                            controller.getAllMovieList();
                            controller.getTopRatedMovieList();
                            controller.getUpcomingMovieList();
                            controller.getPopularMovieList();
                          },
                          child: GridView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:  controller.searchValue.value.length > 1  ? controller.searchMovieList.value.length : controller.topRatedMovieList.value.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.9),
                            itemBuilder: (BuildContext context, int index) {
                              MovieModel model = controller.searchValue.value.length > 1  ?  controller.searchMovieList.value[index] :   controller.topRatedMovieList.value[index];
                              return GridMovieTile(index: index,movieModel: model ,onTapDetail: (){
                                controller.getMovieDetail(model.id.toString());
                                Get.toNamed(Routes.DETAIL);
                              },);
                            },
                          ),
                        ),

                        RefreshIndicator(
                          color: AppColors.colorLightGrey,
                          onRefresh: () async {
                            controller.searchController.clear();
                            controller.searchValue.value = '';
                            controller.getAllMovieList();
                            controller.getTopRatedMovieList();
                            controller.getUpcomingMovieList();
                            controller.getPopularMovieList();
                          },
                          child: GridView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.searchValue.value.length > 1 ? controller.searchMovieList.value.length : controller.upcomingMovieList.value.length ,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.9),
                            itemBuilder: (BuildContext context, int index) {
                              MovieModel model = controller.searchValue.value.length > 1 ? controller.searchMovieList.value[index] :controller.upcomingMovieList.value[index];
                              return GridMovieTile(index: index,movieModel: model ,onTapDetail: (){
                                 controller.getMovieDetail(model.id.toString());
                                 Get.toNamed(Routes.DETAIL);
                              },);
                            },
                          ),
                        ),

                        RefreshIndicator(
                          color: AppColors.colorLightGrey,
                          onRefresh: () async {
                            controller.searchController.clear();
                            controller.searchValue.value = '';
                            controller.getAllMovieList();
                            controller.getTopRatedMovieList();
                            controller.getUpcomingMovieList();
                            controller.getPopularMovieList();
                          },
                          child: GridView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.searchValue.value.length > 1 ? controller.searchMovieList.value.length : controller.popularMovieList.value.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.9),
                            itemBuilder: (BuildContext context, int index) {
                              MovieModel model = controller.searchValue.value.length > 1 ? controller.searchMovieList.value[index] :controller.popularMovieList.value[index];
                              return GridMovieTile(index: index,movieModel: model ,onTapDetail: (){
                                controller.getMovieDetail(model.id.toString());
                                Get.toNamed(Routes.DETAIL);

                              },);
                            },
                          ),
                        )
                      ],

                      ))
                    ],
                  ),

                ),
              ),)
            ]
        )



        ),
    );
  }
}
