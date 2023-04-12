import 'package:base_project_riverpod/src/features/movies/presentations/providers/movie_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/get_popular_movies.dart';

final popularMovieProvider = Provider<GetPopularMovies>((ref) {
  return GetPopularMovies(ref.watch(movieRepositoryProvider));
});
