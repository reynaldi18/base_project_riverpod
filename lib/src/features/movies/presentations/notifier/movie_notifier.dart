import 'package:base_project_riverpod/src/features/movies/presentations/providers/now_playing_movie_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/notifier/pagnation_notifier.dart';
import '../../../../core/pagination_state.dart';
import '../../domain/entities/movie.dart';
import '../providers/popular_movie_provider.dart';

final itemsPopularMovieProvider =
    StateNotifierProvider<PaginationNotifier<Movie>, PaginationState<Movie>>(
  (ref) {
    return PaginationNotifier(
      fetchNextItems: (page) {
        return ref.read(popularMovieProvider).execute(page);
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
        return ref.read(nowPlayingMovieProvider).execute(page);
      },
      itemsPerBatch: 20,
    )..init();
  },
);
