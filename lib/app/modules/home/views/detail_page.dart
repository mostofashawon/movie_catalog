import 'dart:ffi';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/app/modules/home/controllers/home_controller.dart';
import 'package:movie_catalog/app/util/app_assets.dart';
import 'package:movie_catalog/app/util/app_color.dart';

import '../../../data/model/movie_model.dart';
import '../../../util/app_constant.dart';
import '../../../util/app_size.dart';

class DetailPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() => controller.isMovieNetworkLoading.value == true ?
       const Center(child: CircularProgressIndicator(color: AppColors.colorLightGrey)) : CustomScrollView(
        shrinkWrap: true,
          slivers :[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              floating: false,
              stretch: true,
              expandedHeight: screenHeight * 0.70,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenHeight * 0.40,
                      color: Colors.transparent,
                      child:
                      FadeInImage(
                        image: NetworkImage(
                         '${IMAGE_HEADER}${controller.movieDetail.value.posterPath}',
                        ),
                        placeholder: const AssetImage(
                          AppAssets.DEFAULT_IMAGE,
                        ),
                        width: screenWidth,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context,
                            error, stackTrace) {
                          return Image(
                            height: 150,
                            width: screenWidth,
                            fit: BoxFit.cover,
                            image: const AssetImage(AppAssets.DEFAULT_IMAGE,),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 5.0),
                      child:
                      Text(controller.movieDetail.value.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 29,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.colorLightGrey,
                          ),
                          SizedBox(width: 6,),
                          Text(controller.movieDetail.value.runtime.toString()+" mins",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.colorLightGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox(width: 10,),
                          Icon(
                            Icons.star,
                            color: AppColors.colorLightGrey,
                          ),
                          SizedBox(width: 6,),
                          Text(controller.movieDetail.value.voteAverage.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.colorLightGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 25.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Released Date",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColors.colorLightGrey,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),
                              SizedBox(height: 10,),
                              Text(controller.movieDetail.value.releaseDate.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColors.colorLightGrey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Genre",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColors.colorLightGrey,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),
                              SizedBox(height: 10,),
                              Container(
                                height: 30,
                                width: screenWidth / 2,
                                child: ListView.builder(
                                    itemCount: controller.movieDetail.value.genres?.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context , index){
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 3.0,right: 3.0),
                                        child: Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.colorLightGrey
                                            ),
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: Text(
                                                controller.movieDetail.value.genres?[index].name ?? '',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: AppColors.colorLightGrey,
                                                  fontSize: 11
                                                ),

                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )

                            ],
                          )

                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Divider(
                      height: 1,
                      color: AppColors.colorLightGrey,
                    ),
                    const SizedBox(height: 20,),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0,),
                      child: Text("Synopsis",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColors.colorLightGrey,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),),
                    ),

                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ExpandableText(
                          '${controller.movieDetail.value.overview}',
                          expandText: 'See more',
                          maxLines: 3,
                          collapseText: 'see less',
                          style: TextStyle(color: AppColors.colorLightGrey),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0,top: 15.0),
                        child: Text("Related Movies",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.colorLightGrey,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                      SizedBox(height: 15.0,),
                      SizedBox(
                        height: 250,
                        width: screenWidth,
                        child: ListView.builder(
                            itemCount: controller.trendingMovieList.value.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context , index){
                              MovieModel model =  controller.trendingMovieList.value[index];
                              return Padding(
                                padding: const EdgeInsets.only(left: 3.0,right: 3.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(15.0),
                                        topLeft: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0),
                                        bottomRight: Radius.circular(15.0),
                                      ),
                                      child: FadeInImage(
                                        imageErrorBuilder: (context, error, stackTrace) {
                                          return const Image(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              AppAssets.DEFAULT_IMAGE,
                                            ),
                                          );
                                        },
                                        width: 160,
                                        height: 150,
                                        fit: BoxFit.cover,
                                        image: NetworkImage('${IMAGE_HEADER}${model.posterPath}'),
                                        placeholder: const AssetImage(
                                          AppAssets.DEFAULT_IMAGE,),
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          model.originalTitle.toString(),
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 17,fontWeight: FontWeight.bold,color: AppColors.textColor),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      )

                    ],
                  );
                },
                childCount: 1, // Number of list items
              ),
            )

          ]

      )
      ),
    ));
  }


}