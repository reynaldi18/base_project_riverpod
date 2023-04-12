import '../../domain/entities/movie.dart';

abstract class MovieService {
  Future<List<Movie>> getPopularMovie(int page);
  Future<List<Movie>> getNowPlayingMovie(int page);
  Future<Movie> getMovieDetail(int id);
}