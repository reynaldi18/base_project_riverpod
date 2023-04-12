import 'package:dartz/dartz.dart';

import '../../../../network/network_exceptions.dart';
import '../../../../utils/type_defs.dart';
import '../../domain/entities/movie.dart';
import '../services/movie_service.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieService _service;

  MovieRepositoryImpl(this._service);

  @override
  FutureEither<List<Movie>> fetchPopularMovie(int page) async {
    try {
      var response = await _service.getPopularMovie(page);
      return right(response.map((model) => model.toEntity()).toList());
    } catch (e) {
      return left(e as NetworkExceptions);
    }
  }

  @override
  FutureEither<List<Movie>> fetchNowPlayingMovie(int page) async {
    try {
      var response = await _service.getNowPlayingMovie(page);
      return right(response.map((model) => model.toEntity()).toList());
    } catch (e) {
      return left(e as NetworkExceptions);
    }
  }

  @override
  FutureEither<Movie> fetchMovieDetail(int id) async {
    try {
      var response = await _service.getMovieDetail(id);
      return right(response.toEntity());
    } catch (e) {
      return left(e as NetworkExceptions);
    }
  }
}
