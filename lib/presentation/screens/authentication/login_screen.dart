import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../data/models/login/login_state_model.dart';
import '../../../logic/cubit/login/login_cubit.dart';
import '../../routes/route_names.dart';
import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/primary_button.dart';

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
    // debugPrint('height ${Utils.mediaQuery(context).height * 0.2}');
    return   Scaffold(
      appBar: const CustomAppBar(title: 'Login'),
      body: BlocBuilder<LoginCubit, LoginStateModel>(
        builder: (context, state) {
          final isValid = loginCubit.isLoginInputValid();
          return ListView(
            padding: Utils.symmetric(v: 24.0),
            children:  [
              const CustomText(text: 'Welcome to Moviers',fontWeight: FontWeight.w700,fontSize: 20.0),
              Utils.verticalSpace(24.0),
              TextFormField(
                focusNode: loginCubit.loginEmailFocus,
                // initialValue: state.model?.email ?? '',
                controller: loginCubit.emailController,
                onChanged: (String text) {
                  final existing = state.model ?? const LoginStateModel();
                  final updated = existing.copyWith(email: text);
                  loginCubit.addFieldValue(updated);
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Utils.prefixIcon(
                    KImages.emailIcon,
                    state.focusedField == 'login-email' ? primaryColor : whiteColor,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              Utils.verticalSpace(16.0),
              TextFormField(
                focusNode: loginCubit.loginPasswordFocus,
                // initialValue: state.model?.password ?? '',
                controller: loginCubit.passController,
                onChanged: (String text) {
                  final existing = state.model ?? const LoginStateModel();
                  final updated = existing.copyWith(password: text);
                  loginCubit.addFieldValue(updated);
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Utils.prefixIcon(
                    KImages.passwordIcon,
                    state.focusedField == 'login-password' ? primaryColor : whiteColor,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),

              Utils.verticalSpace(16.0),
              const CustomText(text: 'Forgot Password?',
                textAlign: TextAlign.end,
                fontSize: 14.0,
              ),
              Utils.verticalSpace(16.0),
              PrimaryButton(
                text: 'Login',
                textColor: isValid ? whiteColor : grayColor,
                bgColor: isValid ? primaryColor : whiteColor.withValues(alpha: 0.12),
                onPressed: () {
                  if(isValid){
                    Navigator.pushNamedAndRemoveUntil(context,RouteNames.mainScreen,(route)=>false);
                  }
                },
              ),
              Padding(
                padding: Utils.symmetric(h: 0.0, v: 16.0),
                child: const CustomText(
                  text: 'or',
                  textAlign: TextAlign.center,
                  fontSize: 12.0,
                  height: 1.0,
                  color: grayColor,),),

              PrimaryButton(text: 'Login with Apple',
                onPressed: () {},
                textColor: blackColor,
                buttonType: ButtonType.iconButton,
                bgColor: whiteColor,
                fontSize: 16.0,
                borderColor: transparent,
                padding: Utils.only(bottom: 6.0),
                fontWeight: FontWeight.w400,
                icon: const CustomImage(path: KImages.appleIcon,height: 20.0,width: 20.0,),),
              Utils.verticalSpace(16.0),
              PrimaryButton(text: 'Login with Google',
                onPressed: () {},
                textColor: whiteColor,
                buttonType: ButtonType.iconButton,
                bgColor: blackColor,
                borderColor: whiteColor.withValues(alpha: 0.24),
                fontSize: 16.0,
                padding: Utils.only(bottom: 6.0),
                fontWeight: FontWeight.w400,
                icon: const CustomImage(path: KImages.googleIcon,height: 20.0,width: 20.0,),),

              Padding(
                padding: Utils.only(top: Utils.mediaQuery(context).height * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4.0,
                  children: [
                    const CustomText(
                      text: 'Dont have an account?',
                      textAlign: TextAlign.center,
                      height: 1.0,
                      color: grayColor,),
                    GestureDetector(
                      onTap: (){
                        Utils.closeKeyBoard(context);
                        loginCubit.clearField();
                        Navigator.pushNamed(context,RouteNames.signUpScreen);
                      },
                      child: const CustomText(
                        text: 'Sign Up',
                        textAlign: TextAlign.center,
                        height: 1.0,
                        color: primaryColor,),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

