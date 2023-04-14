// Mocks generated by Mockito 5.4.0 from annotations
// in base_project_riverpod/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;

import 'package:base_project_riverpod/src/features/movies/data/services/movie_service.dart'
    as _i13;
import 'package:base_project_riverpod/src/features/movies/domain/entities/movie.dart'
    as _i12;
import 'package:base_project_riverpod/src/features/movies/domain/repositories/movie_repository.dart'
    as _i9;
import 'package:base_project_riverpod/src/models/movie_model.dart' as _i3;
import 'package:base_project_riverpod/src/network/network_exceptions.dart'
    as _i11;
import 'package:dartz/dartz.dart' as _i2;
import 'package:dio/src/adapter.dart' as _i5;
import 'package:dio/src/cancel_token.dart' as _i15;
import 'package:dio/src/dio.dart' as _i14;
import 'package:dio/src/dio_mixin.dart' as _i7;
import 'package:dio/src/options.dart' as _i4;
import 'package:dio/src/response.dart' as _i8;
import 'package:dio/src/transformer.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieModel_1 extends _i1.SmartFake implements _i3.MovieModel {
  _FakeMovieModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseOptions_2 extends _i1.SmartFake implements _i4.BaseOptions {
  _FakeBaseOptions_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHttpClientAdapter_3 extends _i1.SmartFake
    implements _i5.HttpClientAdapter {
  _FakeHttpClientAdapter_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTransformer_4 extends _i1.SmartFake implements _i6.Transformer {
  _FakeTransformer_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInterceptors_5 extends _i1.SmartFake implements _i7.Interceptors {
  _FakeInterceptors_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_6<T> extends _i1.SmartFake implements _i8.Response<T> {
  _FakeResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i9.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<_i2.Either<_i11.NetworkExceptions, List<_i12.Movie>>>
      fetchPopularMovie(int? page) => (super.noSuchMethod(
            Invocation.method(
              #fetchPopularMovie,
              [page],
            ),
            returnValue: _i10.Future<
                    _i2.Either<_i11.NetworkExceptions, List<_i12.Movie>>>.value(
                _FakeEither_0<_i11.NetworkExceptions, List<_i12.Movie>>(
              this,
              Invocation.method(
                #fetchPopularMovie,
                [page],
              ),
            )),
          ) as _i10
              .Future<_i2.Either<_i11.NetworkExceptions, List<_i12.Movie>>>);
  @override
  _i10.Future<_i2.Either<_i11.NetworkExceptions, List<_i12.Movie>>>
      fetchNowPlayingMovie(int? page) => (super.noSuchMethod(
            Invocation.method(
              #fetchNowPlayingMovie,
              [page],
            ),
            returnValue: _i10.Future<
                    _i2.Either<_i11.NetworkExceptions, List<_i12.Movie>>>.value(
                _FakeEither_0<_i11.NetworkExceptions, List<_i12.Movie>>(
              this,
              Invocation.method(
                #fetchNowPlayingMovie,
                [page],
              ),
            )),
          ) as _i10
              .Future<_i2.Either<_i11.NetworkExceptions, List<_i12.Movie>>>);
  @override
  _i10.Future<_i2.Either<_i11.NetworkExceptions, _i12.Movie>> fetchMovieDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMovieDetail,
          [id],
        ),
        returnValue:
            _i10.Future<_i2.Either<_i11.NetworkExceptions, _i12.Movie>>.value(
                _FakeEither_0<_i11.NetworkExceptions, _i12.Movie>(
          this,
          Invocation.method(
            #fetchMovieDetail,
            [id],
          ),
        )),
      ) as _i10.Future<_i2.Either<_i11.NetworkExceptions, _i12.Movie>>);
}

/// A class which mocks [MovieService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieService extends _i1.Mock implements _i13.MovieService {
  MockMovieService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<List<_i3.MovieModel>> getPopularMovie(int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovie,
          [page],
        ),
        returnValue:
            _i10.Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]),
      ) as _i10.Future<List<_i3.MovieModel>>);
  @override
  _i10.Future<List<_i3.MovieModel>?> getNowPlayingMovie(int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovie,
          [page],
        ),
        returnValue: _i10.Future<List<_i3.MovieModel>?>.value(),
      ) as _i10.Future<List<_i3.MovieModel>?>);
  @override
  _i10.Future<_i3.MovieModel> getMovieDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i10.Future<_i3.MovieModel>.value(_FakeMovieModel_1(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i10.Future<_i3.MovieModel>);
}

/// A class which mocks [Dio].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioClient extends _i1.Mock implements _i14.Dio {
  MockDioClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.BaseOptions get options => (super.noSuchMethod(
        Invocation.getter(#options),
        returnValue: _FakeBaseOptions_2(
          this,
          Invocation.getter(#options),
        ),
      ) as _i4.BaseOptions);
  @override
  set options(_i4.BaseOptions? _options) => super.noSuchMethod(
        Invocation.setter(
          #options,
          _options,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.HttpClientAdapter get httpClientAdapter => (super.noSuchMethod(
        Invocation.getter(#httpClientAdapter),
        returnValue: _FakeHttpClientAdapter_3(
          this,
          Invocation.getter(#httpClientAdapter),
        ),
      ) as _i5.HttpClientAdapter);
  @override
  set httpClientAdapter(_i5.HttpClientAdapter? _httpClientAdapter) =>
      super.noSuchMethod(
        Invocation.setter(
          #httpClientAdapter,
          _httpClientAdapter,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Transformer get transformer => (super.noSuchMethod(
        Invocation.getter(#transformer),
        returnValue: _FakeTransformer_4(
          this,
          Invocation.getter(#transformer),
        ),
      ) as _i6.Transformer);
  @override
  set transformer(_i6.Transformer? _transformer) => super.noSuchMethod(
        Invocation.setter(
          #transformer,
          _transformer,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Interceptors get interceptors => (super.noSuchMethod(
        Invocation.getter(#interceptors),
        returnValue: _FakeInterceptors_5(
          this,
          Invocation.getter(#interceptors),
        ),
      ) as _i7.Interceptors);
  @override
  void close({bool? force = false}) => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
          {#force: force},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<_i8.Response<T>> get<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #get,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> getUri<T>(
    Uri? uri, {
    Object? data,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #getUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> post<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #post,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> postUri<T>(
    Uri? uri, {
    Object? data,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #postUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> put<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #put,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> putUri<T>(
    Uri? uri, {
    Object? data,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #putUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> head<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #head,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> headUri<T>(
    Uri? uri, {
    Object? data,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #headUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #headUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> delete<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #delete,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> deleteUri<T>(
    Uri? uri, {
    Object? data,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #deleteUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> patch<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #patch,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> patchUri<T>(
    Uri? uri, {
    Object? data,
    _i4.Options? options,
    _i15.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patchUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #patchUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<dynamic>> download(
    String? urlPath,
    dynamic savePath, {
    _i4.ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    _i15.CancelToken? cancelToken,
    bool? deleteOnError = true,
    String? lengthHeader = r'content-length',
    Object? data,
    _i4.Options? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #download,
          [
            urlPath,
            savePath,
          ],
          {
            #onReceiveProgress: onReceiveProgress,
            #queryParameters: queryParameters,
            #cancelToken: cancelToken,
            #deleteOnError: deleteOnError,
            #lengthHeader: lengthHeader,
            #data: data,
            #options: options,
          },
        ),
        returnValue:
            _i10.Future<_i8.Response<dynamic>>.value(_FakeResponse_6<dynamic>(
          this,
          Invocation.method(
            #download,
            [
              urlPath,
              savePath,
            ],
            {
              #onReceiveProgress: onReceiveProgress,
              #queryParameters: queryParameters,
              #cancelToken: cancelToken,
              #deleteOnError: deleteOnError,
              #lengthHeader: lengthHeader,
              #data: data,
              #options: options,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<dynamic>>);
  @override
  _i10.Future<_i8.Response<dynamic>> downloadUri(
    Uri? uri,
    dynamic savePath, {
    _i4.ProgressCallback? onReceiveProgress,
    _i15.CancelToken? cancelToken,
    bool? deleteOnError = true,
    String? lengthHeader = r'content-length',
    Object? data,
    _i4.Options? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #downloadUri,
          [
            uri,
            savePath,
          ],
          {
            #onReceiveProgress: onReceiveProgress,
            #cancelToken: cancelToken,
            #deleteOnError: deleteOnError,
            #lengthHeader: lengthHeader,
            #data: data,
            #options: options,
          },
        ),
        returnValue:
            _i10.Future<_i8.Response<dynamic>>.value(_FakeResponse_6<dynamic>(
          this,
          Invocation.method(
            #downloadUri,
            [
              uri,
              savePath,
            ],
            {
              #onReceiveProgress: onReceiveProgress,
              #cancelToken: cancelToken,
              #deleteOnError: deleteOnError,
              #lengthHeader: lengthHeader,
              #data: data,
              #options: options,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<dynamic>>);
  @override
  _i10.Future<_i8.Response<T>> request<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i15.CancelToken? cancelToken,
    _i4.Options? options,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #request,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #cancelToken: cancelToken,
            #options: options,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #request,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #cancelToken: cancelToken,
              #options: options,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> requestUri<T>(
    Uri? uri, {
    Object? data,
    _i15.CancelToken? cancelToken,
    _i4.Options? options,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #requestUri,
          [uri],
          {
            #data: data,
            #cancelToken: cancelToken,
            #options: options,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #requestUri,
            [uri],
            {
              #data: data,
              #cancelToken: cancelToken,
              #options: options,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> fetch<T>(_i4.RequestOptions? requestOptions) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetch,
          [requestOptions],
        ),
        returnValue: _i10.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #fetch,
            [requestOptions],
          ),
        )),
      ) as _i10.Future<_i8.Response<T>>);
}
