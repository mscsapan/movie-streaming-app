// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../logic/cubit/login/login_cubit.dart';
import '../personalize/personalize_model.dart';

class LoginStateModel extends Equatable {
  final String email;
  final String password;
  final String confirmPassword;
  final String dateTime;
  final String otp;
  final String focusedField;
  final bool isShowPassword;
  final bool isShowConfirmPassword;
  final LoginStateModel ? model;
  final List<PersonalizeModel> personalizes;
  final LoginState loginState;
  const LoginStateModel({
     this.email = '',
     this.password = '',
     this.confirmPassword = '',
     this.dateTime = '',
     this.otp = '',
     this.focusedField = '',
     this.model,
     this.isShowPassword = false,
     this.isShowConfirmPassword = false,
     this.personalizes = const [],
     this.loginState = const LoginInitial(),
  });

  LoginStateModel copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? dateTime,
    String? otp,
    String? focusedField,
    bool? isShowPassword,
    LoginStateModel ? model,
    bool? isShowConfirmPassword,
    List<PersonalizeModel>? personalizes,
    LoginState? loginState,
  }) {
    return LoginStateModel(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      dateTime: dateTime ?? this.dateTime,
      otp: otp ?? this.otp,
      focusedField: focusedField ?? this.focusedField,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowConfirmPassword: isShowConfirmPassword ?? this.isShowConfirmPassword,
      model: model ?? this.model,
      personalizes: personalizes ?? this.personalizes,
      loginState: loginState ?? this.loginState,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'dateTime': dateTime,
      'otp': otp,
      'isShowPassword': isShowPassword,
      'isShowConfirmPassword': isShowConfirmPassword,
    };
  }

  factory LoginStateModel.fromMap(Map<String, dynamic> map) {
    return LoginStateModel(
      email: map['email'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
      dateTime: map['dateTime'] as String,
      otp: map['otp'] as String,
      isShowPassword: map['isShowPassword'] as bool,
      isShowConfirmPassword: map['isShowConfirmPassword'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginStateModel.fromJson(String source) => LoginStateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      email,
      password,
      confirmPassword,
      dateTime,
      otp,
      focusedField,
      isShowPassword,
      isShowConfirmPassword,
      model,
      personalizes,
      loginState,
    ];
  }
}
