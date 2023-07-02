// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_todo_app_clean_code/core/network/network_info.dart'
    as _i6;
import 'package:flutter_todo_app_clean_code/core/usecases/usecase.dart' as _i17;
import 'package:flutter_todo_app_clean_code/core/utils/injectable_module.dart'
    as _i25;
import 'package:flutter_todo_app_clean_code/data/datasources/setting/setting_local_data_source.dart'
    as _i8;
import 'package:flutter_todo_app_clean_code/data/datasources/todo/todo_local_data_source.dart'
    as _i13;
import 'package:flutter_todo_app_clean_code/data/datasources/todo/todo_remote_data_source.dart'
    as _i14;
import 'package:flutter_todo_app_clean_code/data/models/todo/todo_model.dart'
    as _i18;
import 'package:flutter_todo_app_clean_code/data/respositories/setting/setting_repository_impl.dart'
    as _i10;
import 'package:flutter_todo_app_clean_code/data/respositories/todo/todo_repository_impl.dart'
    as _i16;
import 'package:flutter_todo_app_clean_code/domain/repositories/setting/setting_repository.dart'
    as _i9;
import 'package:flutter_todo_app_clean_code/domain/repositories/todo/todo_repository.dart'
    as _i15;
import 'package:flutter_todo_app_clean_code/domain/usecases/setting/change_app_theme_mode.dart'
    as _i21;
import 'package:flutter_todo_app_clean_code/domain/usecases/setting/get_setting.dart'
    as _i24;
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/add_todo.dart'
    as _i20;
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/delete_todo.dart'
    as _i22;
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/get_all_todo.dart'
    as _i23;
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/get_todo.dart'
    as _i19;
import 'package:flutter_todo_app_clean_code/presentation/blocs/setting/setting_bloc.dart'
    as _i7;
import 'package:flutter_todo_app_clean_code/presentation/blocs/todo/todo_cubit.dart'
    as _i11;
import 'package:flutter_todo_app_clean_code/presentation/blocs/todo_form/todo_form_cubit.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.singleton<_i3.Dio>(injectableModule.dioClient);
    gh.singleton<_i4.FirebaseFirestore>(injectableModule.prefs);
    gh.singleton<_i5.InternetConnectionChecker>(injectableModule.connectivity);
    gh.factory<_i6.NetworkInfo>(
        () => _i6.NetworkInfoImpl(gh<_i5.InternetConnectionChecker>()));
    gh.lazySingleton<_i7.SettingBloc>(() => _i7.SettingBloc());
    gh.lazySingleton<_i8.SettingLocalDataSource>(
        () => _i8.SettingLocalDataSourceImpl());
    gh.lazySingleton<_i9.SettingRepository>(() => _i10.SettingRepositoryImpl(
        settingLocalDataSource: gh<_i8.SettingLocalDataSource>()));
    gh.lazySingleton<_i11.TodoCubit>(() => _i11.TodoCubit());
    gh.lazySingleton<_i12.TodoFormCubit>(() => _i12.TodoFormCubit());
    gh.lazySingleton<_i13.TodoLocalDataSource>(
        () => _i13.TodoLocalDataSourceImpl());
    gh.factory<_i14.TodoRemoteDataSource>(
        () => _i14.TodoRemoteDataSourceImpl());
    gh.lazySingleton<_i15.TodoRepository>(() => _i16.TodoRepositoryImpl(
          todoLocalDataSource: gh<_i13.TodoLocalDataSource>(),
          remoteDataSource: gh<_i14.TodoRemoteDataSource>(),
          networkInfo: gh<_i6.NetworkInfo>(),
        ));
    gh.lazySingleton<_i17.UseCase<_i18.TodoModel, _i19.Params>>(
        () => _i19.GetTodo(gh<_i15.TodoRepository>()));
    gh.lazySingleton<_i20.AddTodo>(
        () => _i20.AddTodo(gh<_i15.TodoRepository>()));
    gh.lazySingleton<_i21.ChangeAppThemeMode>(
        () => _i21.ChangeAppThemeMode(gh<_i9.SettingRepository>()));
    gh.lazySingleton<_i22.DeleteTodo>(
        () => _i22.DeleteTodo(gh<_i15.TodoRepository>()));
    gh.lazySingleton<_i23.GetAllTodo>(
        () => _i23.GetAllTodo(gh<_i15.TodoRepository>()));
    gh.lazySingleton<_i24.GetSetting>(
        () => _i24.GetSetting(gh<_i9.SettingRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i25.InjectableModule {}
