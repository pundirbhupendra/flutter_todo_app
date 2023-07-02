import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../network/dio_client.dart';

@module
abstract class InjectableModule {
  @singleton
  InternetConnectionChecker get connectivity => InternetConnectionChecker();

  @singleton
  Dio get dioClient => DioClient.getInstance();
  @singleton
  FirebaseFirestore get prefs => FirebaseFirestore.instance;
}
