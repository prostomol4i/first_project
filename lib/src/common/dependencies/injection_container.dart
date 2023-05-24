import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

initGetIt() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
        BaseOptions(baseUrl: 'http://45.10.110.181:8080/api/v1/')),
  );
}
