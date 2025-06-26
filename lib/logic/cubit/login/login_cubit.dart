import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/login/login_state_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStateModel> {

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();
  final FocusNode dateFocus = FocusNode();

  LoginCubit() : super(const LoginStateModel()) {
    emailFocus.addListener(() => _onFocusChanged('email', emailFocus));
    passwordFocus.addListener(() => _onFocusChanged('password', passwordFocus));
    confirmPasswordFocus.addListener(() => _onFocusChanged('confirm', confirmPasswordFocus));
    dateFocus.addListener(() => _onFocusChanged('date', dateFocus));
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

  @override
  Future<void> close() {
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    dateFocus.dispose();
    return super.close();
  }
}

