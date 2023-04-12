import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../features/movies/domain/entities/movie.dart';
import 'belongs_to_collection_model.dart';
import 'genre_model.dart';
import 'production_company_model.dart';
import 'production_country_model.dart';
import 'spoken_language_model.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Equatable {
  final int? id;
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final String? title;
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @JsonKey(name: "belongs_to_collection")
  final BelongsToCollectionModel? belongsToCollection;
  final int? budget;
  final List<GenreModel>? genres;
  final String? homepage;
  @JsonKey(name: "imdb_id")
  final String? imdbId;
  @JsonKey(name: "production_companies")
  final List<ProductionCompanyModel>? productionCompanies;
  @JsonKey(name: "production_countries")
  final List<ProductionCountryModel>? productionCountries;
  final int? revenue;
  final int? runtime;
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguageModel>? spokenLanguages;
  final String? status;
  final String? tagline;

  const MovieModel({
    this.id,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.productionCompanies,
    this.productionCountries,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  Movie toEntity() {
    return Movie(
      id: id,
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
      belongsToCollection: belongsToCollection?.toEntity(),
      budget: budget,
      genres: genres?.map((genre) => genre.toEntity()).toList(),
      homepage: homepage,
      imdbId: imdbId,
      productionCompanies: productionCompanies
          ?.map((productionCompany) => productionCompany.toEntity())
          .toList(),
      productionCountries: productionCountries
          ?.map((productionCountry) => productionCountry.toEntity())
          .toList(),
      revenue: revenue,
      runtime: runtime,
      spokenLanguages: spokenLanguages
          ?.map((spokenLanguage) => spokenLanguage.toEntity())
          .toList(),
      status: status,
      tagline: tagline,
    );
  }

  @override
  List<Object?> get props => [
        id,
        adult,
        backdropPath,
        genreIds,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        belongsToCollection,
        budget,
        genres,
        homepage,
        imdbId,
        productionCompanies,
        productionCountries,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
      ];
}
