import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../features/movies/domain/entities/genre.dart';

part 'genre_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GenreModel extends Equatable {
  final int? id;
  final String? name;

  const GenreModel({
    this.id,
    this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);

  Genre toEntity() {
    return Genre(
      id: id,
      name: name,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
