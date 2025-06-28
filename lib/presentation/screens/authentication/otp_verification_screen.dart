import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../data/models/login/login_state_model.dart';
import '../../../logic/cubit/login/login_cubit.dart';
import '../../routes/route_names.dart';
import '../../utils/constraints.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/primary_button.dart';
import 'sign_up_screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key, required this.isNew});

  final bool isNew;

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'OTP Verification'),
      body: BlocBuilder<LoginCubit, LoginStateModel>(
        builder: (context, state) {
          final isValid = loginCubit.validOTP();
          return ListView(
            padding: Utils.symmetric(),
            children: [
              Utils.verticalSpace(Utils.mediaQuery(context).height * 0.02),

              const CustomText(
                text: 'Code is sent to +1 412 **** ***31',
                fontSize: 14.0,
                color: grayColor50,
                textAlign: TextAlign.center,
                height: 1.4,
              ),
              Utils.verticalSpace(24.0),
              Pinput(
                length: 4,
                defaultPinTheme: PinTheme(
                  height: Utils.vSize(48.0),
                  width: Utils.vSize(48.0),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: fontFamily,
                  ),

                  decoration: BoxDecoration(
                    // color: whiteColor,
                    borderRadius: Utils.borderRadius(r: 4.0),
                    border: Border.all(
                        color: whiteColor.withValues(alpha: 0.24)),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: Utils.vSize(48.0),
                  width: Utils.vSize(48.0),
                  textStyle: const TextStyle(
                      fontSize: 20.0,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: fontFamily
                  ),

                  decoration: BoxDecoration(
                    // color: whiteColor,
                    borderRadius: Utils.borderRadius(r: 4.0),
                    border: Border.all(color: primaryColor),
                  ),
                ),
                autofocus: true,
                onChanged: (String code) {
                  final existing = state.model ?? const LoginStateModel();
                  final updated = existing.copyWith(otp: code);
                  loginCubit.addFieldValue(updated);
                },
                onCompleted: (String code) {},
              ),
              termsCondition(),
              Utils.verticalSpace(Utils.mediaQuery(context).height * 0.18),
              PrimaryButton(
                text: 'Verify',
                textColor: isValid ? whiteColor : grayColor,
                bgColor: isValid ? primaryColor : whiteColor.withValues(
                    alpha: 0.12),
                onPressed: () {
                  Utils.closeKeyBoard(context);
                  if (isValid) {
                    Navigator.pushNamed(context,RouteNames.personalizeScreen);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
