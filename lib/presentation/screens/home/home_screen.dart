import 'package:flutter/material.dart';
import 'package:movie_streaming_app/presentation/routes/route_packages_name.dart';
import 'package:movie_streaming_app/presentation/utils/k_images.dart';
import 'package:movie_streaming_app/presentation/utils/utils.dart';
import 'package:movie_streaming_app/presentation/widgets/header_text.dart';

import '../../../data/dummy_data/dummy_data.dart';
import '../../../data/models/personalize/personalize_model.dart';
import '../../routes/route_names.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('height ${Utils.mediaQuery(context).height * 0.21}');
    return  Scaffold(
      // appBar: CustomAppBar(title: 'Home',isLeading: false),
      body: ListView(
        padding: Utils.all(),
        children: [
          SizedBox(
          height: Utils.mediaQuery(context).height * 0.44,
          width: Utils.mediaQuery(context).width,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomImage(path: KImages.homeBanner, height: Utils.mediaQuery(context).height * 0.44, width: double.infinity, fit: BoxFit.fill),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                       blackColor,
                        transparent,
                      ],
                      stops: [0.0, 0.3],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                    padding: Utils.symmetric(),
                    child: Column(
                      spacing: 10.0,
                      children: [
                        const CustomText(text:
                          'Rogue One: A Star Wars Story',
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0,
                        ),

                        Row(
                          spacing: 6.0,
                          children: [
                            Padding(
                              padding: Utils.only(bottom:2.0),
                              child: const Icon(Icons.star,color: yellow,size: 16.0),
                            ),
                            Flexible(
                              child: CustomText(
                                text: '8.4',
                                maxLine: 1,
                                color: yellow,
                              ),
                            ),
                            Flexible(
                              child: CustomText(
                                text: '2016',
                                maxLine: 1,
                                color: grayColor60,
                              ),
                            ),
                            CustomText(
                              text: '1h 54m',
                              maxLine: 1,
                              color: grayColor60,
                            ),
                            CustomText(
                              text: 'Sci-Fi',
                              maxLine: 1,
                              color: grayColor60,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: Utils.symmetric(v: 24.0),
            child: Row(
              children: [
                Flexible(
                  child: PrimaryButton(text: 'Watch Movie',
                    onPressed: () {},
                    textColor: whiteColor,
                    buttonType: ButtonType.iconButton,
                    fontSize: 16.0,
                    borderColor: transparent,
                    padding: Utils.only(bottom: 6.0),
                    fontWeight: FontWeight.w400,
                    icon: const CustomImage(path: KImages.playPauseIcon,height: 20.0,width: 20.0,),),
                ),
                Container(
                  height: 48.0,
                  width: 48.0,
                  margin: Utils.only(left: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: Utils.borderRadius(),
                    color: whiteColor.withValues(alpha: 0.12),
                  ),
                  child: const CustomImage(path: KImages.favoriteIcon)
                ),
              ],
            ),
          ),

          Column(
            children: [
              HeadingText(title: 'Top Chart',onTap: (){
                Navigator.pushNamed(context,RouteNames.topChartScreen);
              },),
              SingleChildScrollView(
                padding: Utils.symmetric(v: 24.0),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(homeTopCharts.length, (index) {
                    final service = homeTopCharts[index];
                    return HomeChartItem(
                      item: service,
                      width: Utils.mediaQuery(context).width * 0.7,
                      imageHeight: Utils.mediaQuery(context).height * 0.21,
                    );
                  }),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}

class HomeChartItem extends StatelessWidget {
  const HomeChartItem({super.key, required this.item,this.width,this.imageHeight});

  final PersonalizeModel item;
  final double ? width;
  final double ? imageHeight;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Utils.mediaQuery(context).width,
      margin: Utils.only(right: 10.0),
      // padding: Utils.symmetric(h: 8.0,v: 10.0).copyWith(bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Utils.mediaQuery(context).width,
            height: imageHeight?? Utils.mediaQuery(context).height * 0.21,
            margin: Utils.only(bottom: 10.0),
            child:   ClipRRect(
              borderRadius: Utils.borderRadius(r: 4.0),
              child: CustomImage(path: item.image,fit: BoxFit.fill,
                width: Utils.mediaQuery(context).width,
                height: imageHeight?? Utils.mediaQuery(context).height * 0.21,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: item.name,
                maxLine: 3,
                overflow: TextOverflow.ellipsis,
                fontSize: 16.0,
                height: 1.4,
              ),
              Utils.verticalSpace(6.0),
              Row(
                spacing: 6.0,
                children: [
                  Padding(
                    padding: Utils.only(bottom:2.0),
                    child: const Icon(Icons.star,color: yellow,size: 16.0),
                  ),
                  Flexible(
                    child: CustomText(
                      text: '${item.rating}',
                      maxLine: 1,
                      color: yellow,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                  ),
                  Flexible(
                    child: CustomText(
                      text: '${item.year}',
                      maxLine: 1,
                      color: grayColor60,
                      fontSize: 12.0,
                    ),
                  ),
                  CustomText(
                    text: item.duration,
                    maxLine: 1,
                    color: grayColor60,
                    fontSize: 12.0,
                  ),

                  const CustomText(
                    text: 'Action',
                    maxLine: 1,
                    color: grayColor60,
                    fontSize: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
