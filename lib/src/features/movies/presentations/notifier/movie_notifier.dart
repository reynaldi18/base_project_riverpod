import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/notifier/pagnation_notifier.dart';
import '../../../../core/pagination_state.dart';
import '../../domain/entities/movie.dart';
import '../providers/movie_repository_provider.dart';

final itemsPopularMovieProvider =
    StateNotifierProvider<PaginationNotifier<Movie>, PaginationState<Movie>>(
  (ref) {
    return PaginationNotifier(
      fetchNextItems: (page) {
        return ref.read(movieRepositoryProvider).fetchPopularMovie(page);
      },
      itemsPerBatch: 20,
    )..init();
  },
);

final itemsNowPlayingMovieProvider =
    StateNotifierProvider<PaginationNotifier<Movie>, PaginationState<Movie>>(
  (ref) {
    return PaginationNotifier(
      fetchNextItems: (page) {
        return ref.read(movieRepositoryProvider).fetchNowPlayingMovie(page);
      },
      itemsPerBatch: 20,
    )..init();
  },
);
