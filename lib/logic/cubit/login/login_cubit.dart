import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/login/login_state_model.dart';
import '../../../data/models/personalize/personalize_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStateModel> {

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode loginEmailFocus = FocusNode();
  final FocusNode loginPasswordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();
  final FocusNode dateFocus = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  LoginCubit() : super(const LoginStateModel()) {
    debugPrint('called multiple times in login cubit constructor');
    emailFocus.addListener(() => _onFocusChanged('email', emailFocus));
    passwordFocus.addListener(() => _onFocusChanged('password', passwordFocus));
    confirmPasswordFocus.addListener(() => _onFocusChanged('confirm', confirmPasswordFocus));
    dateFocus.addListener(() => _onFocusChanged('date', dateFocus));
    loginEmailFocus.addListener(() => _onFocusChanged('login-email', dateFocus));
    loginPasswordFocus.addListener(() => _onFocusChanged('login-password', dateFocus));
  }

  void _onFocusChanged(String field, FocusNode node) {
    if (node.hasFocus) {
      emit(state.copyWith(focusedField: field));
    } else if (state.focusedField == field) {
      emit(state.copyWith(focusedField: ''));
    }
  }


  void addFieldValue(LoginStateModel  ? model){
    emit(state.copyWith(model: model));
  }


  bool isSignUpInputValid() {
    final model = state.model;
    if (model == null) return false;

    return [
      model.email,
      model.password,
      model.confirmPassword,
      model.dateTime,
    ].every((e) => e.trim().isNotEmpty);
  }

  bool isLoginInputValid() {
    final model = state.model;
    if (model == null) return false;

    return [model.email, model.password].every((e) => e.trim().isNotEmpty);
  }

  bool validOTP(){
    final model = state.model;

    if (model == null) return false;

    return model.otp.trim().length == 4;
  }

  void addPersonalize(PersonalizeModel model){
    final updated = List.of(state.personalizes);

    if(!state.personalizes.contains(model)){
      updated.add(model);
    }else{
      updated.remove(model);
    }

    emit(state.copyWith(personalizes: updated));
  }

  void clearField(){
    // const model = LoginStateModel(
    //   email: '',
    //   password: '',
    //   confirmPassword: '',
    //   dateTime: '',
    //   otp: '',
    //   focusedField: '',
    //   isShowPassword: false,
    //   isShowConfirmPassword: false,);
    emailController.clear();
    passController.clear();
    debugPrint('before-model ${state.model}');
    emit(state.copyWith(model:const LoginStateModel()));
    debugPrint('after-model ${state.model}');
  }

  @override
  Future<void> close() {
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    dateFocus.dispose();
    return super.close();
  }
}

