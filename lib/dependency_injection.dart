import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependency_injection_packages.dart';
import 'logic/cubit/login/login_cubit.dart';

class DInjector {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> initDB() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static final repositoryProvider = <RepositoryProvider>[
    RepositoryProvider<Client>(
      create: (context) => Client(),
    ),
    RepositoryProvider<SharedPreferences>(
      create: (context) => _sharedPreferences,
    ),
    RepositoryProvider<RemoteDataSource>(
      create: (context) => RemoteDataSourceImpl(
        client: context.read(),
      ),
    ),
    RepositoryProvider<LocalDataSource>(
      create: (context) => LocalDataSourceImpl(
        sharedPreferences: context.read(),
      ),
    ),


  ];

  static final blocProviders = <BlocProvider>[
    BlocProvider<InternetStatusBloc>(create: (context) => InternetStatusBloc()),
    BlocProvider<LoginCubit>(
      create: (BuildContext context) => LoginCubit(),
    ),


  ];
}
