import 'package:base_project_riverpod/src/features/movies/domain/entities/movie.dart';
import 'package:base_project_riverpod/src/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularMovies useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetPopularMovies(mockMovieRepository);
  });

  final tMovies = <Movie>[];

  test('should get list of movies from the repository', () async {
    const tId = 1;
    
    // arrange
    when(mockMovieRepository.fetchPopularMovie(tId))
        .thenAnswer((_) async => Right(tMovies));
    // act
    final result = await useCase.execute(tId);
    // assert
    expect(result, Right(tMovies));
  });
}
