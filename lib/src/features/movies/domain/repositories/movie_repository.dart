import '../../../../utils/type_defs.dart';
import '../entities/movie.dart';

abstract class MovieRepository {
  FutureEither<List<Movie>> fetchPopularMovie(int page);
  FutureEither<List<Movie>> fetchNowPlayingMovie(int page);
  FutureEither<Movie?> getMovieDetail(int id);
}