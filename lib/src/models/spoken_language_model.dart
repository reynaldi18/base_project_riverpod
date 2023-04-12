import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../features/movies/domain/entities/spoken_language.dart';

part 'spoken_language_model.g.dart';

@JsonSerializable()
class SpokenLanguageModel extends Equatable {
  final String? englishName;
  final String? iso6391;
  final String? name;

  const SpokenLanguageModel({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageModelToJson(this);

  SpokenLanguage toEntity() {
    return SpokenLanguage(
      englishName: englishName,
      iso6391: iso6391,
      name: name,
    );
  }

  @override
  List<Object?> get props => [
        englishName,
        iso6391,
        name,
      ];
}
