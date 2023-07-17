import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_clean_code/injection_container.dart';
import 'package:injectable/injectable.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/entities/setting/setting.dart';
import '../../../domain/usecases/setting/change_app_theme_mode.dart';
import '../../../domain/usecases/setting/get_setting.dart';
import 'package:equatable/equatable.dart';

part 'setting_event.dart';

part 'setting_state.dart';

@lazySingleton
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    getSetting = getIt<GetSetting>(); // GetSetting(getIt<SettingRepository>());
    changeAppThemeMode = getIt<
        ChangeAppThemeMode>(); //ChangeAppThemeMode(getIt<SettingRepository>());
  }
  late final GetSetting getSetting;
  late final ChangeAppThemeMode changeAppThemeMode;

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is LoadSettingEvent) {
      yield SettingLoadingState();
      final getSettingFailedOrSuccess = await getSetting(NoParams());
      yield getSettingFailedOrSuccess.fold(
        (l) {
          //  print("SettingLoadFailState : $l");
          return SettingLoadFailState();
        },
        (r) {
          //  print("SettingLoadSuccessState : $r");
          return SettingLoadSuccessState(setting: r);
        },
      );
    }

    if (event is ChangeAppThemeModeEvent) {
      yield SettingLoadingState();
      final changeAppThemeModeFailedOrSuccess =
          await changeAppThemeMode(Params(appThemeMode: event.appThemeMode));
      yield changeAppThemeModeFailedOrSuccess.fold(
        (l) {
          return AppThemeModeChangeFailState();
        },
        (r) {
          return AppThemeModeChangeSuccessState();
        },
      );
    }
  }

  @override
  void onTransition(Transition<SettingEvent, SettingState> transition) {
    print("SettingBloc : $transition");
    super.onTransition(transition);
  }
}
