import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/environment_config.dart';
import 'dio_interceptor_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  var dio = Dio(BaseOptions(baseUrl: EnvironmentConfig.baseUrl));
  dio.interceptors.add(ref.read(dioInterceptorProvider));
  return dio;
});
