import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dependency_injection.dart';
import 'presentation/routes/route_names.dart';
import 'presentation/utils/constraints.dart';
import 'presentation/widgets/custom_theme.dart';
import 'presentation/widgets/fetch_error_text.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await DInjector.initDB();
  runApp(const MovieStreamingApp());
}

class MovieStreamingApp extends StatelessWidget {
  const MovieStreamingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, child) {
        return MultiRepositoryProvider(
          providers: DInjector.repositoryProvider,
          child: MultiBlocProvider(
            providers: DInjector.blocProviders,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteNames.generateRoutes,
              initialRoute: RouteNames.mainScreen,
              theme: MyTheme.theme,
              onUnknownRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (_) => Scaffold(
                    body: FetchErrorText(
                        text: 'No Route Found ${settings.name}',
                        textColor: blackColor),
                  ),
                );
              },
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: child??const SizedBox.shrink(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
