import 'package:base_project_riverpod/src/network/network_exceptions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/request_state.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../domain/entities/movie.dart';
import '../providers/movie_repository_provider.dart';

class MovieDetailNotifier extends StateNotifier<RequestState<Movie?>> {
  final int id;
  final MovieRepository repository;

  MovieDetailNotifier(this.id, this.repository)
      : super(const RequestState.initial());

  Future<void> getMovieDetail() async {
    state = const RequestState.loading();
    final result = await repository.getMovieDetail(id);
    result.fold(
      (l) {
        state = RequestState.error(l.stringError());
      },
      (data) {
        state = RequestState.success(data);
      },
    );
  }
}

final movieDetailProvider = StateNotifierProvider.family<MovieDetailNotifier,
    RequestState<Movie?>, int>(
  (ref, int id) {
    return MovieDetailNotifier(id, ref.watch(movieRepositoryProvider))
      ..getMovieDetail();
  },
);
