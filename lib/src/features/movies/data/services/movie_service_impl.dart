import 'package:base_project_riverpod/src/features/movies/domain/entities/movie.dart';
import 'package:dio/dio.dart';

import '../../../../config/environment_config.dart';
import '../../domain/entities/movies.dart';
import 'movie_service.dart';

class MovieServiceImpl extends MovieService {
  final Dio dio;

  MovieServiceImpl(this.dio);

  @override
  Future<List<Movie>> getPopularMovie(int page) async {
    final response = await dio.get(
      'movie/popular',
      queryParameters: {
        'api_key': EnvironmentConfig.apiKey,
        'page': page,
      },
    );
    return Movies.fromJson(response.data).results ?? [];
  }

  @override
  Future<List<Movie>> getNowPlayingMovie(int page) async {
    final response = await dio.get(
      'movie/now_playing',
      queryParameters: {
        'api_key': EnvironmentConfig.apiKey,
        'page': page,
      },
    );
    return Movies.fromJson(response.data).results ?? [];
  }

  @override
  Future<Movie> getMovieDetail(int id) async {
    final response = await dio.get(
      'movie/$id',
      queryParameters: {
        'api_key': EnvironmentConfig.apiKey,
      },
    );
    return Movie.fromJson(response.data);
  }
}
