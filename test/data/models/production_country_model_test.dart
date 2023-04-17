import 'package:base_project_riverpod/src/features/movies/domain/entities/production_country.dart';
import 'package:base_project_riverpod/src/models/production_country_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tProductionCountryModel = ProductionCountryModel(
    iso31661: 'iso',
    name: 'Name',
  );

  const tProductionCountry = ProductionCountry(
    iso31661: 'iso',
    name: 'Name',
  );

  test('should be a subclass of ProductionCompany entity', () async {
    final result = tProductionCountryModel.toEntity();
    expect(result, tProductionCountry);
  });

  test('should return a JSON map containing proper data', () async {
    // arrange

    // act
    final result = tProductionCountryModel.toJson();
    // assert
    final expectedJsonMap = {
      "iso31661": 'iso',
      "name": 'Name',
    };
    expect(result, expectedJsonMap);
  });
}
