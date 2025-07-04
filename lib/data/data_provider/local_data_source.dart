import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/errors/exception.dart';
import '../../presentation/utils/k_string.dart';

abstract class LocalDataSource {
  bool checkOnBoarding();

  Future<bool> cachedOnBoarding();

  Future<bool> clearUserResponse();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> cachedOnBoarding() async {
    return sharedPreferences.setBool(KString.cachedOnBoardingKey, true);
  }

  @override
  bool checkOnBoarding() {
    final jsonString = sharedPreferences.getBool(KString.cachedOnBoardingKey);
    if (jsonString != null) {
      return true;
    } else {
      throw const DatabaseException('Not cached yet');
    }
  }


  @override
  Future<bool> clearUserResponse() {
    return sharedPreferences.remove(KString.getExistingUserResponseKey);
  }
}
