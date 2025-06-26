import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/data/models/login/login_state_model.dart';
import 'package:movie_streaming_app/logic/cubit/login/login_cubit.dart';
import 'package:movie_streaming_app/presentation/routes/route_packages_name.dart';
import 'package:movie_streaming_app/presentation/utils/utils.dart';
import 'package:movie_streaming_app/presentation/widgets/primary_button.dart';

import '../../utils/k_images.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginCubit loginCubit;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init(){
    loginCubit = context.read<LoginCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const CustomAppBar(title: 'Login'),
      body: BlocBuilder<LoginCubit, LoginStateModel>(
        builder: (context, state) {
          return ListView(
            padding: Utils.symmetric(v: 24.0),
            children:  [
              const CustomText(text: 'Welcome to Moviers',fontWeight: FontWeight.w700,fontSize: 20.0),
              Utils.verticalSpace(24.0),
              TextFormField(
                focusNode: loginCubit.emailFocus,
                initialValue: state.model?.email ?? '',
                onChanged: (String text) {
                  final existing = state.model ?? const LoginStateModel();
                  final updated = existing.copyWith(email: text);
                  loginCubit.addFieldValue(updated);
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: prefixIcon(
                    KImages.emailIcon,
                    state.focusedField == 'email' ? primaryColor : whiteColor,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              Utils.verticalSpace(16.0),
              TextFormField(
                focusNode: loginCubit.passwordFocus,
                initialValue: state.model?.password ?? '',
                onChanged: (String text) {
                  final existing = state.model ?? const LoginStateModel();
                  final updated = existing.copyWith(password: text);
                  loginCubit.addFieldValue(updated);
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: prefixIcon(
                    KImages.passwordIcon,
                    state.focusedField == 'password' ? primaryColor : whiteColor,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              Utils.verticalSpace(16.0),
              TextFormField(
                focusNode: loginCubit.confirmPasswordFocus,
                decoration:   InputDecoration(
                  hintText: 'Confirm Password',
                  prefixIcon: prefixIcon(
                    KImages.passwordIcon,
                    state.focusedField == 'confirm' ? primaryColor : whiteColor,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              Utils.verticalSpace(16.0),
              TextFormField(
                focusNode: loginCubit.dateFocus,
                decoration: InputDecoration(
                  hintText: 'DD/MM/YYYY',
                  prefixIcon: prefixIcon(
                    KImages.dateTimeIcon,
                    state.focusedField == 'date' ? primaryColor : whiteColor,
                  ),
                ),
                keyboardType: TextInputType.datetime,
              ),
                Utils.verticalSpace(16.0),
              const CustomText(text: 'Forgot Password?',
                textAlign: TextAlign.end,
                fontSize: 14.0,
              ),
                Utils.verticalSpace(16.0),
              PrimaryButton(text: 'Login', onPressed: (){}),

            ],
          );
        },
      ),
    );
  }
}

Widget prefixIcon(String path,[Color color = whiteColor]) {
  return Padding(
    padding: Utils.all(value: 12.0),
    child: CustomImage(path: path,color: color,height: 20.0,width: 20.0),
  );
}
