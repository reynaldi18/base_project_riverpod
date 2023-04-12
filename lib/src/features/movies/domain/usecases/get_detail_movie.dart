import '../../../../utils/type_defs.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetDetailMovie {
  final MovieRepository repository;

  GetDetailMovie(this.repository);

  FutureEither<Movie> execute(int id) {
    return repository.fetchMovieDetail(id);
  }
}
