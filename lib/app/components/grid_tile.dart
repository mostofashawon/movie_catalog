import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_catalog/app/data/model/movie_model.dart';

import '../util/app_assets.dart';
import '../util/app_color.dart';
import '../util/app_constant.dart';
import '../util/app_size.dart';

class GridMovieTile extends StatelessWidget {
  const GridMovieTile({super.key,required this.index,required this.movieModel,required this.onTapDetail});

  final index;
  final MovieModel movieModel;
  final VoidCallback? onTapDetail;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTapDetail,
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0,right: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                width: screenWidth / 2,
                fit: BoxFit.cover,
                height: index.isEven ? 200 : 180,
                image: NetworkImage('${IMAGE_HEADER}${movieModel.posterPath}'),
                placeholder: const AssetImage(
                  AppAssets.DEFAULT_IMAGE,),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              movieModel.originalTitle.toString(),
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 13,fontWeight: FontWeight.bold,color: AppColors.textColor),
            )
          ],
        ),
      ),
    );
  }

}