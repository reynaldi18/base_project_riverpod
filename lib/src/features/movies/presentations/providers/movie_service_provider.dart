import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../network/providers/dio_provider.dart';
import '../../data/services/movie_service.dart';
import '../../data/services/movie_service_impl.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  return MovieServiceImpl(ref.read(dioProvider));
});