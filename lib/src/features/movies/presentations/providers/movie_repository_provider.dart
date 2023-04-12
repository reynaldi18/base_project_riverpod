import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/repositories/movie_repository.dart';
import '../../data/repositories/movie_repository_impl.dart';
import 'movie_service_provider.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepositoryImpl(ref.watch(movieServiceProvider));
});