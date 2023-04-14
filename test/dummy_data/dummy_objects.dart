import 'package:base_project_riverpod/src/features/movies/domain/entities/genre.dart';
import 'package:base_project_riverpod/src/features/movies/domain/entities/movie.dart';

const testMovieDetail = Movie(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalLanguage: 'en',
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  popularity: 1.0,
  video: false,
  budget: 100,
  homepage: 'https://google.com',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
  imdbId: 'imdb1',
  revenue: 12000,
  status: 'Status',
  tagline: 'Tagline',
);
