import '../../../../models/movie_model.dart';

abstract class MovieService {
  Future<List<MovieModel>> getPopularMovie(int page);
  Future<List<MovieModel>> getNowPlayingMovie(int page);
  Future<MovieModel> getMovieDetail(int id);
}