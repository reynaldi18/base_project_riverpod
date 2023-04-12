// import 'package:json_annotation/json_annotation.dart';
//
// part 'movie_model.g.dart';
//
// @JsonSerializable()
// class MovieModel {
//   int? id;
//   bool? adult;
//   @JsonKey(name: 'backdrop_path')
//   String? backdropPath;
//   @JsonKey(name: 'genre_ids')
//   List<int>? genreIds;
//   @JsonKey(name: 'original_language')
//   String? originalLanguage;
//   @JsonKey(name: 'original_title')
//   String? originalTitle;
//   String? overview;
//   double? popularity;
//   @JsonKey(name: 'poster_path')
//   String? posterPath;
//   @JsonKey(name: 'release_date')
//   String? releaseDate;
//   String? title;
//   bool? video;
//   @JsonKey(name: 'vote_average')
//   double? voteAverage;
//   @JsonKey(name: 'vote_count')
//   int? voteCount;
//   @JsonKey(name: "belongs_to_collection")
//   BelongsToCollection? belongsToCollection;
//   int? budget;
//   List<Genre>? genres;
//   String? homepage;
//   @JsonKey(name: "imdb_id")
//   String? imdbId;
//   @JsonKey(name: "production_companies")
//   List<ProductionCompany>? productionCompanies;
//   @JsonKey(name: "production_countries")
//   List<ProductionCountry>? productionCountries;
//   int? revenue;
//   int? runtime;
//   @JsonKey(name: "spoken_languages")
//   List<SpokenLanguage>? spokenLanguages;
//   String? status;
//   String? tagline;
//
//   MovieModel({
//     this.id,
//     this.adult,
//     this.backdropPath,
//     this.genreIds,
//     this.originalLanguage,
//     this.originalTitle,
//     this.overview,
//     this.popularity,
//     this.posterPath,
//     this.releaseDate,
//     this.title,
//     this.video,
//     this.voteAverage,
//     this.voteCount,
//     this.belongsToCollection,
//     this.budget,
//     this.genres,
//     this.homepage,
//     this.imdbId,
//     this.productionCompanies,
//     this.productionCountries,
//     this.revenue,
//     this.runtime,
//     this.spokenLanguages,
//     this.status,
//     this.tagline,
//   });
//
//   factory MovieModel.fromJson(Map<String, dynamic> json) =>
//       _$MovieModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$MovieModelToJson(this);
// }
