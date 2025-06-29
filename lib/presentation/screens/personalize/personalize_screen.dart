import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/dummy_data/dummy_data.dart';
import '../../../data/models/login/login_state_model.dart';
import '../../../data/models/personalize/personalize_model.dart';
import '../../../logic/cubit/login/login_cubit.dart';
import '../../routes/route_names.dart';
import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/primary_button.dart';

class PersonalizeScreen extends StatefulWidget {
  const PersonalizeScreen({super.key});

  @override
  State<PersonalizeScreen> createState() => _PersonalizeScreenState();
}

class _PersonalizeScreenState extends State<PersonalizeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: 'Personalize'),
      body: SingleChildScrollView(
        padding: Utils.symmetric(v: 24.0),
        child: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'Choose your genre ',
                  fontSize: 16.0,
                  color: grayColor50,
                  textAlign: TextAlign.center,
                  height: 1.4,
                ),
                BlocBuilder<LoginCubit, LoginStateModel>(
                  builder: (context, state) {
                    return  CustomText(
                      text: '${state.personalizes.length} from ${personalizes.length}',
                      fontSize: 16.0,
                      color: primaryColor,
                      textAlign: TextAlign.center,
                      height: 1.4,
                    );
                  },
                )
              ],
            ),
            Utils.verticalSpace(24.0),
            Wrap(
              runSpacing: 20.0,
              spacing: 12.0,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: List.generate(personalizes.length, (index) {
                final service = personalizes[index];
                return PersonalizeItem(
                  item: service,
                  width: Utils.mediaQuery(context).width * 0.42,
                  // imageHeight: Utils.mediaQuery(context).height * 0.14,
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: Utils.symmetric(v: 10.0),
        child: PrimaryButton(
          text: 'Continue',
          onPressed: ()=>Navigator.pushNamedAndRemoveUntil(context,RouteNames.mainScreen,(route)=>false),
        ),
      ),
    );
  }
}


class PersonalizeItem extends StatelessWidget {
  const PersonalizeItem({super.key, required this.item,this.width,this.imageHeight});

  final PersonalizeModel item;
  final double ? width;
  final double ? imageHeight;


  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginStateModel>(
      builder: (context, state) {
        final isSelected = state.personalizes.contains(item);
        return GestureDetector(
          onTap: state.personalizes.isNotEmpty? (){
            loginCubit.addPersonalize(item);
          }:null,
          onLongPress: state.personalizes.isEmpty? (){
            loginCubit.addPersonalize(item);
          }:null,
          child: SizedBox(
            width: width ?? Utils.mediaQuery(context).width * 0.5,
            // padding: Utils.symmetric(h: 8.0,v: 10.0).copyWith(bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: Utils.mediaQuery(context).width,
                  height: imageHeight?? Utils.mediaQuery(context).height * 0.21,
                  margin: Utils.only(bottom: 10.0),
                  decoration: isSelected? BoxDecoration(
                    border: Border.all(color: primaryColor, width: 2.0),
                    borderRadius: Utils.borderRadius(r: 4.0),
                  ):null,
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
                      if(isSelected)...[
                        const Positioned(
                          top: 8.0,
                          right: 8.0,
                          child: CustomImage(path: KImages.checkDoneIcon),
                          // child: Icon(Icons.check_circle,color: primaryColor),
                        ),
                      ],

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
                        const CustomImage(path: KImages.likeUserIcon),
                        Flexible(
                          child: CustomText(
                            text: '${Utils.priceSeparator(item.likes)} like this',
                            maxLine: 1,
                            color: grayColor60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


