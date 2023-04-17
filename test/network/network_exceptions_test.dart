import 'dart:io';

import 'package:base_project_riverpod/src/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NetworkExceptions', () {
    test('requestCancelled should return a RequestCancelled object', () {
      const exception = NetworkExceptions.requestCancelled();
      expect(exception, isA<RequestCancelled>());
    });

    test(
        'should throw a NetworkExceptions when the response is DioErrorType.badResponse',
        () {
      final dioError = DioError(
        response: Response(
          statusCode: 503,
          requestOptions: RequestOptions(path: 'path'),
        ),
        type: DioErrorType.badResponse,
        requestOptions: RequestOptions(path: 'path'),
      );

      final networkException = NetworkExceptions.getDioException(dioError);
      const exception = NetworkExceptions.serviceUnavailable();
      final errorMessage = exception.stringError();

      expect(networkException, isA<NetworkExceptions>());
      expect(errorMessage, equals("Service unavailable"));
    });

    test(
        'should throw a NetworkExceptions when the response is DioErrorType.badResponse but cannot find status code',
        () {
      final dioError = DioError(
        response: Response(
          statusCode: 505,
          requestOptions: RequestOptions(path: 'path'),
        ),
        type: DioErrorType.badResponse,
        requestOptions: RequestOptions(path: 'path'),
      );

      final networkException = NetworkExceptions.getDioException(dioError);
      final exception =
          NetworkExceptions.defaultError('${dioError.response?.statusCode}');
      final errorMessage = exception.stringError();

      expect(networkException, isA<NetworkExceptions>());
      expect(errorMessage, equals("505"));
    });

    test(
        'should throw a NetworkExceptions when the response error is SocketException',
        () {
      const error = SocketException('No internet connection');

      final networkException = NetworkExceptions.getDioException(error);
      const exception = NetworkExceptions.noInternetConnection();
      final errorMessage = exception.stringError();

      expect(networkException, isA<NetworkExceptions>());
      expect(errorMessage, equals("No internet connection"));
    });

    test('returns format exception when given FormatException', () {
      final error = Exception();

      final networkException = NetworkExceptions.getDioException(error);

      expect(networkException, isA<NetworkExceptions>());
    });
  });

  group('NetworkErrorAsync', () {
    test('stringError should return "Request Cancelled" for RequestCancelled',
        () {
      const exception = NetworkExceptions.requestCancelled();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Request Cancelled'));
    });

    test(
        'stringError should return "Internal Server Error" for InternalServerError',
        () {
      const exception = NetworkExceptions.internalServerError();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Internal Server Error'));
    });

    test('stringError should return "Not Found" for notFound', () {
      const exception = NetworkExceptions.notFound('Not Found');
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Not Found'));
    });

    test(
        'stringError should return "Service unavailable" for serviceUnavailable',
        () {
      const exception = NetworkExceptions.serviceUnavailable();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Service unavailable'));
    });

    test('stringError should return "Method Allowed" for methodNotAllowed', () {
      const exception = NetworkExceptions.methodNotAllowed();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Method Allowed'));
    });

    test('stringError should return "Bad request" for badRequest', () {
      const exception = NetworkExceptions.badRequest();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Bad request'));
    });

    test(
        'stringError should return "Unauthorised request" for unauthorisedRequest',
        () {
      const exception = NetworkExceptions.unauthorisedRequest();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Unauthorised request'));
    });

    test(
        'stringError should return "Unexpected error occurred" for unexpectedError',
        () {
      const exception = NetworkExceptions.unexpectedError();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Unexpected error occurred'));
    });

    test('stringError should return "requestTimeout" for requestTimeout', () {
      const exception = NetworkExceptions.requestTimeout();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('requestTimeout'));
    });

    test(
        'stringError should return "No internet connection" for noInternetConnection',
        () {
      const exception = NetworkExceptions.noInternetConnection();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('No internet connection'));
    });

    test('stringError should return "Error due to a conflict" for conflict',
        () {
      const exception = NetworkExceptions.conflict();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Error due to a conflict'));
    });

    test(
        'stringError should return "Send timeout in connection with API server" for sendTimeout',
        () {
      const exception = NetworkExceptions.sendTimeout();
      final errorMessage = exception.stringError();
      expect(
          errorMessage, equals('Send timeout in connection with API server'));
    });

    test(
        'stringError should return "Unable to process the data" for unableToProcess',
        () {
      const exception = NetworkExceptions.unableToProcess();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Unable to process the data'));
    });

    test('stringError should return "defaultError" for defaultError', () {
      const exception = NetworkExceptions.defaultError('defaultError');
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('defaultError'));
    });

    test(
        'stringError should return "Unexpected error occurred" for formatException',
        () {
      const exception = NetworkExceptions.formatException();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Unexpected error occurred'));
    });

    test('stringError should return "Not acceptable" for notAcceptable', () {
      const exception = NetworkExceptions.notAcceptable();
      final errorMessage = exception.stringError();
      expect(errorMessage, equals('Not acceptable'));
    });
  });
}
