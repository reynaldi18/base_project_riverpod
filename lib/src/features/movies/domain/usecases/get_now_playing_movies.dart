import '../../../../utils/type_defs.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  FutureEither<List<Movie>> execute(int page) {
    return repository.fetchNowPlayingMovie(page);
  }
}
