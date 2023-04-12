import 'package:base_project_riverpod/src/models/movie_model.dart';
import 'package:base_project_riverpod/src/models/movie_response.dart';
import 'package:dio/dio.dart';

import '../../../../config/environment_config.dart';
import 'movie_service.dart';

class MovieServiceImpl extends MovieService {
  final Dio dio;

  MovieServiceImpl(this.dio);

  @override
  Future<List<MovieModel>> getPopularMovie(int page) async {
    final response = await dio.get(
      'movie/popular',
      queryParameters: {
        'api_key': EnvironmentConfig.apiKey,
        'page': page,
      },
    );
    return MovieResponse.fromJson(response.data).results ?? [];
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovie(int page) async {
    final response = await dio.get(
      'movie/now_playing',
      queryParameters: {
        'api_key': EnvironmentConfig.apiKey,
        'page': page,
      },
    );
    return MovieResponse.fromJson(response.data).results ?? [];
  }

  @override
  Future<MovieModel> getMovieDetail(int id) async {
    final response = await dio.get(
      'movie/$id',
      queryParameters: {
        'api_key': EnvironmentConfig.apiKey,
      },
    );
    return MovieModel.fromJson(response.data);
  }
}
