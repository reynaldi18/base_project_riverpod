import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/get_now_playing_movies.dart';
import 'movie_repository_provider.dart';

final nowPlayingMovieProvider = Provider<GetNowPlayingMovies>((ref) {
  return GetNowPlayingMovies(ref.watch(movieRepositoryProvider));
});