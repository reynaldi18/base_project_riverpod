import 'dart:convert';

import 'package:base_project_riverpod/src/features/movies/data/services/movie_service_impl.dart';
import 'package:base_project_riverpod/src/models/movie_model.dart';
import 'package:base_project_riverpod/src/models/movie_response.dart';
import 'package:base_project_riverpod/src/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  const API_KEY = 'c8f6ce9a00896969a96546e69386a31b';

  late MovieServiceImpl service;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    // final options = BaseOptions(baseUrl: BASE_URL);
    // when(mockDioClient.options).thenReturn(options);
    service = MovieServiceImpl(mockDioClient);
  });

  group('get Popular Movies', () {
    final tMovieList =
        MovieResponse.fromJson(json.decode(readJson('dummy_data/popular.json')))
            .results;

    test('should return list of Movie Model when the response code is 200',
            () async {
          // arrange
          when(mockDioClient.get(
            'movie/popular',
            queryParameters: {
              'api_key': API_KEY,
              'page': 1,
            },
          )).thenAnswer((_) async => Response(
            data: json.decode(readJson('dummy_data/popular.json')),
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));
          // act
          final result = await service.getPopularMovie(1);
          // assert
          expect(result, equals(tMovieList));
        });

    test('should throw a NetworkExceptions when the response code is not 200',
            () async {
          // Arrange
          when(mockDioClient.get(
            'movie/now_playing',
            queryParameters: {
              'api_key': API_KEY,
              'page': 1,
            },
          )).thenThrow(DioError(
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(path: ''),
            ),
            requestOptions: RequestOptions(path: ''),
          ));

          // act
          final result = service.getPopularMovie(1);

          // assert
          expect(result, throwsA(isA<NetworkExceptions>()));
        });
  });

  group('get Now Playing Movies', () {
    final tMovieList = MovieResponse.fromJson(
            json.decode(readJson('dummy_data/now_playing.json')))
        .results;

    test('should return list of Movie Model when the response code is 200',
        () async {
      // arrange
      when(mockDioClient.get(
        'movie/now_playing',
        queryParameters: {
          'api_key': API_KEY,
          'page': 1,
        },
      )).thenAnswer((_) async => Response(
            data: json.decode(readJson('dummy_data/now_playing.json')),
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));
      // act
      final result = await service.getNowPlayingMovie(1);
      // assert
      expect(result, equals(tMovieList));
    });

    test('should throw a NetworkExceptions when the response code is not 200',
        () async {
      // Arrange
      when(mockDioClient.get(
        'movie/now_playing',
        queryParameters: {
          'api_key': API_KEY,
          'page': 1,
        },
      )).thenThrow(DioError(
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: ''),
        ),
        requestOptions: RequestOptions(path: ''),
      ));

      // act
      final result = service.getNowPlayingMovie(1);

      // assert
      expect(result, throwsA(isA<NetworkExceptions>()));
    });
  });

  group('get Movie Detail', () {
    const tId = 1;
    final tMovieDetail = MovieModel.fromJson(
        json.decode(readJson('dummy_data/movie_detail.json')));

    test('should return movie detail when the response code is 200', () async {
      // arrange
      when(mockDioClient.get(
        'movie/$tId',
        queryParameters: {
          'api_key': API_KEY,
        },
      )).thenAnswer((_) async => Response(
            data: json.decode(readJson('dummy_data/movie_detail.json')),
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));
      // act
      final result = await service.getMovieDetail(tId);
      // assert
      expect(result, equals(tMovieDetail));
    });

    test('should throw a NetworkExceptions when the response code is not 200',
        () async {
      // Arrange
      when(mockDioClient.get(
        'movie/$tId',
        queryParameters: {
          'api_key': API_KEY,
        },
      )).thenThrow(DioError(
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: ''),
        ),
        requestOptions: RequestOptions(path: ''),
      ));

      // act
      final result = service.getMovieDetail(tId);

      // assert
      expect(result, throwsA(isA<NetworkExceptions>()));
    });
  });
}
