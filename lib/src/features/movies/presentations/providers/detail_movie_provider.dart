import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/get_detail_movie.dart';
import 'movie_repository_provider.dart';

final detailMovieProvider = Provider<GetDetailMovie>((ref) {
  return GetDetailMovie(ref.watch(movieRepositoryProvider));
});
