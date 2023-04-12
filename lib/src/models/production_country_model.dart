import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../features/movies/domain/entities/production_country.dart';

part 'production_country_model.g.dart';

@JsonSerializable()
class ProductionCountryModel extends Equatable {
  final String? iso31661;
  final String? name;

  const ProductionCountryModel({
    this.iso31661,
    this.name,
  });

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryModelToJson(this);

  ProductionCountry toEntity() {
    return ProductionCountry(
      iso31661: iso31661,
      name: name,
    );
  }

  @override
  List<Object?> get props => [
        iso31661,
        name,
      ];
}
