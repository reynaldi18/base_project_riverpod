import 'package:base_project_riverpod/src/features/movies/domain/usecases/get_detail_movie.dart';
import 'package:base_project_riverpod/src/network/network_exceptions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/request_state.dart';
import '../../domain/entities/movie.dart';
import '../providers/detail_movie_provider.dart';

class MovieDetailNotifier extends StateNotifier<RequestState<Movie?>> {
  final int id;
  final GetDetailMovie useCase;

  MovieDetailNotifier(this.id, this.useCase)
      : super(const RequestState.initial());

  Future<void> getMovieDetail() async {
    state = const RequestState.loading();
    final result = await useCase.execute(id);
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
    return MovieDetailNotifier(id, ref.watch(detailMovieProvider))
      ..getMovieDetail();
  },
);
