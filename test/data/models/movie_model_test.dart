import 'package:base_project_riverpod/src/features/movies/domain/entities/movie.dart';
import 'package:base_project_riverpod/src/features/movies/domain/entities/production_company.dart';
import 'package:base_project_riverpod/src/features/movies/domain/entities/production_country.dart';
import 'package:base_project_riverpod/src/features/movies/domain/entities/spoken_language.dart';
import 'package:base_project_riverpod/src/models/movie_model.dart';
import 'package:base_project_riverpod/src/models/production_company_model.dart';
import 'package:base_project_riverpod/src/models/production_country_model.dart';
import 'package:base_project_riverpod/src/models/spoken_language_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tMovieModel = MovieModel(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
    productionCompanies: [
      ProductionCompanyModel(
        id: 1,
        logoPath: 'logoPath',
        name: 'Name',
        originCountry: 'en',
      ),
    ],
    productionCountries: [
      ProductionCountryModel(
        iso31661: 'iso',
        name: 'Name',
      ),
    ],
    spokenLanguages: [
      SpokenLanguageModel(
        englishName: 'english',
        iso6391: 'iso',
        name: 'Name',
      ),
    ],
  );

  const tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
    productionCompanies: [
      ProductionCompany(
        id: 1,
        logoPath: 'logoPath',
        name: 'Name',
        originCountry: 'en',
      )
    ],
    productionCountries: [
      ProductionCountry(
        iso31661: 'iso',
        name: 'Name',
      ),
    ],
    spokenLanguages: [
      SpokenLanguage(
        englishName: 'english',
        iso6391: 'iso',
        name: 'Name',
      ),
    ],
  );

  test('should be a subclass of Movie entity', () async {
    final result = tMovieModel.toEntity();
    expect(result, tMovie);
  });
}
