import '../../../../utils/type_defs.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  FutureEither<List<Movie>> execute(int page) {
    return repository.fetchPopularMovie(page);
  }
}
