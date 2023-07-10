import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'core/theme/dark_theme_data.dart';
import 'core/theme/light_theme_data.dart';
import 'presentation/blocs/todo/todo_cubit.dart';
import 'presentation/blocs/todo_form/todo_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/presentation/some_went_wrong_page.dart';
import 'core/route/route.dart';
import 'domain/entities/setting/setting.dart';
import 'presentation/blocs/setting/setting_bloc.dart';
import 'presentation/pages/todo/todo_home_page.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingBloc>(create: (context) => getIt<SettingBloc>()),
        BlocProvider<TodoFormCubit>(
            create: (context) => getIt<TodoFormCubit>()),
        BlocProvider<TodoCubit>(create: (context) => getIt<TodoCubit>()),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (BuildContext context, SettingState settingState) {
          if (settingState is SettingLoadingState ||
              settingState is SettingInitial) {
            return MaterialApp(
              title: 'DoneIt',
              theme: lightThemeData,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              darkTheme: darkThemeData,
              home: TodoHomePage(),
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          } else if (settingState is SettingLoadSuccessState) {
            return MaterialApp(
              title: 'DoneIt',
              theme: lightThemeData,
              debugShowCheckedModeBanner: false,
              themeMode: settingState.setting.appThemeMode == AppThemeMode.dark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              darkTheme: darkThemeData,
              home: TodoHomePage(),
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          }
          return MaterialApp(
            theme: lightThemeData,
            debugShowCheckedModeBanner: false,
            home: SomeThingWentWrongPage(),
          );
        },
      ),
    );
  }
}

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8mJpZ4_zv-ALvGWBZ05IjNKwpX8lTiV4',
    appId: '1:657052441327:android:b07eef2dd7e9023ac9991a',
    messagingSenderId: '657052441327',
    projectId: 'todo-app-dccf0',
    //  databaseURL:
    //  'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
    //  storageBucket: 'flutterfire-e2e-tests.appspot.com',
  );
}
//flutter packages pub run build_runner build
//flutter packages pub run build_runner watch