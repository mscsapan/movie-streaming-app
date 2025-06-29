import 'package:flutter/material.dart';

import '../../../data/dummy_data/dummy_data.dart';
import '../../../data/models/personalize/personalize_model.dart';
import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';

class TopChartScreen extends StatelessWidget {
  const TopChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('height ${Utils.mediaQuery(context).height * 0.31}');
    return  Scaffold(
      appBar: const CustomAppBar(title: 'Top Charts'),
      body: SingleChildScrollView(
        padding: Utils.symmetric(v: 24.0),
        child: Column(
          children: [
            Wrap(
              runSpacing: 20.0,
              spacing: 12.0,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: List.generate(topCharts.length, (index) {
                final service = topCharts[index];
                return ChartItem(
                  item: service,
                  width: Utils.mediaQuery(context).width * 0.42,
                  imageHeight: Utils.mediaQuery(context).height * 0.31,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}


class ChartItem extends StatelessWidget {
  const ChartItem({super.key, required this.item,this.width,this.imageHeight});

  final PersonalizeModel item;
  final double ? width;
  final double ? imageHeight;


  @override
  Widget build(BuildContext context) {
      return SizedBox(
    width: width ?? Utils.mediaQuery(context).width * 0.5,
    // padding: Utils.symmetric(h: 8.0,v: 10.0).copyWith(bottom: 16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: Utils.mediaQuery(context).width,
          height: imageHeight?? Utils.mediaQuery(context).height * 0.21,
          margin: Utils.only(bottom: 10.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: Utils.borderRadius(r: 4.0),
                child: CustomImage(path: item.image,fit: BoxFit.fill,
                  width: Utils.mediaQuery(context).width,
                  height: imageHeight?? Utils.mediaQuery(context).height * 0.21,
                ),
              ),


            ],
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
              ],
            ),
          ],
        ),
      ],
    ),
  );
  }
}