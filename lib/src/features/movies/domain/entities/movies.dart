import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'movies.g.dart';

@JsonSerializable()
class Movies {
  int? page;
  List<Movie>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  Movies({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
