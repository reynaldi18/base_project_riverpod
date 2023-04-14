import 'package:base_project_riverpod/src/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:base_project_riverpod/src/features/movies/domain/entities/movie.dart';
import 'package:base_project_riverpod/src/models/genre_model.dart';
import 'package:base_project_riverpod/src/models/movie_model.dart';
import 'package:base_project_riverpod/src/network/network_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MovieRepositoryImpl repository;
  late MockMovieService mockService;

  setUp(() {
    mockService = MockMovieService();
    repository = MovieRepositoryImpl(mockService);
  });

  const tMovieModel = MovieModel(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );

  const tMovie = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );

  final tMovieModelList = <MovieModel>[tMovieModel];
  final tMovieList = <Movie>[tMovie];

  group('Popular Movies', () {
    test('should return movie list when call to service is success', () async {
      // arrange
      when(mockService.getPopularMovie(1))
          .thenAnswer((_) async => tMovieModelList);
      // act
      final result = await repository.fetchPopularMovie(1);
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tMovieList);
    });

    test('should return server failure when call to service is unsuccessful',
        () async {
      // arrange
      when(mockService.getPopularMovie(1))
          .thenThrow(const NetworkExceptions.unexpectedError());
      // act
      final result = await repository.fetchPopularMovie(1);
      // assert
      expect(result, const Left(NetworkExceptions.unexpectedError()));
    });
  });

  group('Now Playing Movies', () {
    test('should return movie list when call to service is success', () async {
      // arrange
      when(mockService.getNowPlayingMovie(1))
          .thenAnswer((_) async => tMovieModelList);
      // act
      final result = await repository.fetchNowPlayingMovie(1);
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tMovieList);
    });

    test('should return server failure when call to service is unsuccessful',
        () async {
      // arrange
      when(mockService.getNowPlayingMovie(1))
          .thenThrow(const NetworkExceptions.unexpectedError());
      // act
      final result = await repository.fetchNowPlayingMovie(1);
      // assert
      expect(result, const Left(NetworkExceptions.unexpectedError()));
    });
  });

  group('Get Movie Detail', () {
    const tId = 1;
    const tMovieResponse = MovieModel(
      adult: false,
      backdropPath: 'backdropPath',
      budget: 100,
      genres: [GenreModel(id: 1, name: 'Action')],
      homepage: "https://google.com",
      id: 1,
      imdbId: 'imdb1',
      originalLanguage: 'en',
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      revenue: 12000,
      runtime: 120,
      status: 'Status',
      tagline: 'Tagline',
      title: 'title',
      video: false,
      voteAverage: 1,
      voteCount: 1,
    );

    test('should return movie data when call to service is success', () async {
      // arrange
      when(mockService.getMovieDetail(tId))
          .thenAnswer((_) async => tMovieResponse);
      // act
      final result = await repository.fetchMovieDetail(tId);
      // assert
      final resultData = result.getOrElse(() => const Movie());
      verify(mockService.getMovieDetail(tId));
      expect(resultData, equals(testMovieDetail));
    });

    test('should return server failure when call to service is unsuccessful',
        () async {
      // arrange
      when(mockService.getMovieDetail(tId))
          .thenThrow(const NetworkExceptions.unexpectedError());
      // act
      final result = await repository.fetchMovieDetail(tId);
      // assert
      verify(mockService.getMovieDetail(tId));
      expect(result, const Left(NetworkExceptions.unexpectedError()));
    });
  });
}
