import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../features/movies/domain/entities/belongs_to_collection.dart';

part 'belongs_to_collection_model.g.dart';

@JsonSerializable()
class BelongsToCollectionModel extends Equatable {
  final int? id;
  final String? name;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;

  const BelongsToCollectionModel({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionModelToJson(this);

  BelongsToCollection toEntity() {
    return BelongsToCollection(
      id: id,
      name: name,
      posterPath: posterPath,
      backdropPath: backdropPath,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        posterPath,
        backdropPath,
      ];
}
