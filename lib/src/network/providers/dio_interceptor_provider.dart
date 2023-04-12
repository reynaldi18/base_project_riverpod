import 'package:base_project_riverpod/src/utils/preference_helper.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final dioInterceptorProvider = Provider<InterceptorsWrapper>((ref) {
  var logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  final sharedPreferences = ref.watch(preferenceHelperProvider);
  String? authToken = sharedPreferences.token();

  return InterceptorsWrapper(
    onRequest: (options, handler) async {
      options.headers = {
        'Content-Type': options.data is FormData
            ? 'multipart/form-data'
            : Headers.jsonContentType,
        'Accept': 'application/json',
        if (authToken != null) 'Authorization': 'Bearer $authToken'
      };
      logger.i('--> ${options.method} ${options.uri}');
      logger.i('Headers: ${options.headers}');
      logger.i('Body: ${options.data}');
      return handler.next(options);
    },
    onResponse: (response, handler) async {
      logger.i(
          '<-- ${response.statusCode} ${response.statusMessage} ${response.requestOptions.uri}');
      logger.i('Headers: ${response.headers}');
      logger.i('Body: ${response.data}');
      return handler.next(response);
    },
    onError: (err, handler) async {
      logger.i(
          '<-- ${err.response?.statusCode} ${err.response?.statusMessage} ${err.response?.requestOptions.uri}');
      logger.i('Headers: ${err.response?.headers}');
      logger.i('Error: ${err.response?.data}');
      return handler.next(err);
    },
  );
});
