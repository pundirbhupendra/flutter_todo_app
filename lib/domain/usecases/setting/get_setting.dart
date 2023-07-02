import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/setting/setting.dart';
import '../../repositories/setting/setting_repository.dart';

//@LazySingleton(as: UseCase)
@lazySingleton
class GetSetting implements UseCase<Setting, NoParams> {
  final SettingRepository settingRepository;

  GetSetting(this.settingRepository);

  @override
  Future<Either<Failure, Setting>> call(NoParams noParams) async {
    return await settingRepository.getSetting();
  }
}
