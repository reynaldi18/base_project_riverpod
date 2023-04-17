import 'dart:convert';

import 'package:base_project_riverpod/src/models/movie_model.dart';
import 'package:base_project_riverpod/src/models/movie_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';

void main() {
  const tMovieModel = MovieModel(
    id: 1,
    adult: false,
    backdropPath: "/path.jpg",
    genreIds: [1, 2, 3, 4],
    originalLanguage: "en",
    originalTitle: "Original Title",
    overview: "Overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    releaseDate: "2020-05-05",
    title: "Title",
    video: false,
    voteAverage: 1.0,
    voteCount: 1,
    belongsToCollection: null,
    budget: null,
    genres: null,
    homepage: null,
    imdbId: null,
    productionCompanies: null,
    productionCountries: null,
    revenue: null,
    runtime: null,
    spokenLanguages: null,
    status: null,
    tagline: null,
  );

  const tMovieResponseModel = MovieResponse(
    page: 1,
    results: [tMovieModel],
    totalPages: 47,
    totalResults: 940,
  );

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/now_playing.json'));
      // act
      final result = MovieResponse.fromJson(jsonMap);
      // assert
      expect(result, tMovieResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tMovieResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "page": 1,
        "results": [
          {
            "id": 1,
            "adult": false,
            "backdrop_path": "/path.jpg",
            "genre_ids": [1, 2, 3, 4],
            "original_language": "en",
            "original_title": "Original Title",
            "overview": "Overview",
            "popularity": 1.0,
            "poster_path": "/path.jpg",
            "release_date": "2020-05-05",
            "title": "Title",
            "video": false,
            "vote_average": 1.0,
            "vote_count": 1,
            "belongs_to_collection": null,
            "budget": null,
            "genres": null,
            "homepage": null,
            "imdb_id": null,
            "production_companies": null,
            "production_countries": null,
            "revenue": null,
            "runtime": null,
            "spoken_languages": null,
            "status": null,
            "tagline": null,
          }
        ],
        "total_pages": 47,
        "total_results": 940
      };
      expect(result, expectedJsonMap);
    });
  });
}
