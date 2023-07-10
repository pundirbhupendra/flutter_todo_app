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
    as _i7;
import 'package:flutter_todo_app_clean_code/core/usecases/usecase.dart' as _i19;
import 'package:flutter_todo_app_clean_code/core/utils/injectable_module.dart'
    as _i25;
import 'package:flutter_todo_app_clean_code/data/datasources/setting/setting_local_data_source.dart'
    as _i9;
import 'package:flutter_todo_app_clean_code/data/datasources/todo/todo_local_data_source.dart'
    as _i16;
import 'package:flutter_todo_app_clean_code/data/datasources/todo/todo_remote_data_source.dart'
    as _i5;
import 'package:flutter_todo_app_clean_code/data/models/todo/todo_model.dart'
    as _i20;
import 'package:flutter_todo_app_clean_code/data/respositories/setting/setting_repository_impl.dart'
    as _i11;
import 'package:flutter_todo_app_clean_code/data/respositories/todo/todo_repository_impl.dart'
    as _i18;
import 'package:flutter_todo_app_clean_code/domain/repositories/setting/setting_repository.dart'
    as _i10;
import 'package:flutter_todo_app_clean_code/domain/repositories/todo/todo_repository.dart'
    as _i17;
import 'package:flutter_todo_app_clean_code/domain/usecases/setting/change_app_theme_mode.dart'
    as _i23;
import 'package:flutter_todo_app_clean_code/domain/usecases/setting/get_setting.dart'
    as _i24;
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/add_todo.dart'
    as _i22;
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/delete_todo.dart'
    as _i14;
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/get_all_todo.dart'
    as _i13;
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/get_todo.dart'
    as _i21;
import 'package:flutter_todo_app_clean_code/presentation/blocs/setting/setting_bloc.dart'
    as _i8;
import 'package:flutter_todo_app_clean_code/presentation/blocs/todo/todo_cubit.dart'
    as _i12;
import 'package:flutter_todo_app_clean_code/presentation/blocs/todo_form/todo_form_cubit.dart'
    as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i6;

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
    gh.factory<_i5.FirebaseService>(
        () => _i5.FirebaseService(gh<_i4.FirebaseFirestore>()));
    gh.singleton<_i6.InternetConnectionChecker>(injectableModule.connectivity);
    gh.factory<_i7.NetworkInfo>(
        () => _i7.NetworkInfoImpl(gh<_i6.InternetConnectionChecker>()));
    gh.lazySingleton<_i8.SettingBloc>(() => _i8.SettingBloc());
    gh.lazySingleton<_i9.SettingLocalDataSource>(
        () => _i9.SettingLocalDataSourceImpl());
    gh.lazySingleton<_i10.SettingRepository>(() => _i11.SettingRepositoryImpl(
        settingLocalDataSource: gh<_i9.SettingLocalDataSource>()));
    gh.lazySingleton<_i12.TodoCubit>(() => _i12.TodoCubit(
          getAllTodo: gh<_i13.GetAllTodo>(),
          deleteTodo: gh<_i14.DeleteTodo>(),
        ));
    gh.lazySingleton<_i15.TodoFormCubit>(() => _i15.TodoFormCubit());
    gh.lazySingleton<_i16.TodoLocalDataSource>(
        () => _i16.TodoLocalDataSourceImpl());
    gh.factory<_i5.TodoRemoteDataSource>(
        () => _i5.TodoRemoteDataSourceImpl(gh<_i5.FirebaseService>()));
    gh.lazySingleton<_i17.TodoRepository>(() => _i18.TodoRepositoryImpl(
          todoLocalDataSource: gh<_i16.TodoLocalDataSource>(),
          remoteDataSource: gh<_i5.TodoRemoteDataSource>(),
          networkInfo: gh<_i7.NetworkInfo>(),
        ));
    gh.lazySingleton<_i19.UseCase<_i20.TodoModel, _i21.Params>>(
        () => _i21.GetTodo(gh<_i17.TodoRepository>()));
    gh.lazySingleton<_i22.AddTodo>(
        () => _i22.AddTodo(gh<_i17.TodoRepository>()));
    gh.lazySingleton<_i23.ChangeAppThemeMode>(
        () => _i23.ChangeAppThemeMode(gh<_i10.SettingRepository>()));
    gh.lazySingleton<_i14.DeleteTodo>(
        () => _i14.DeleteTodo(gh<_i17.TodoRepository>()));
    gh.lazySingleton<_i13.GetAllTodo>(
        () => _i13.GetAllTodo(gh<_i17.TodoRepository>()));
    gh.lazySingleton<_i24.GetSetting>(
        () => _i24.GetSetting(gh<_i10.SettingRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i25.InjectableModule {}
