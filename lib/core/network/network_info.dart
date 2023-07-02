import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@Injectable(as: NetworkInfo)
class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;
  NetworkInfoImpl(this.internetConnectionChecker);

  @override
  Future<bool> get isConnected async =>
      await InternetConnectionChecker().hasConnection;
}
