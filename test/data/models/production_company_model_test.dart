import 'package:base_project_riverpod/src/features/movies/domain/entities/production_company.dart';
import 'package:base_project_riverpod/src/models/production_company_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tProductionCompanyModel = ProductionCompanyModel(
    id: 1,
    logoPath: 'logoPath',
    name: 'Name',
    originCountry: 'en',
  );

  const tProductionCompany = ProductionCompany(
    id: 1,
    logoPath: 'logoPath',
    name: 'Name',
    originCountry: 'en',
  );

  test('should be a subclass of ProductionCompany entity', () async {
    final result = tProductionCompanyModel.toEntity();
    expect(result, tProductionCompany);
  });

  test('should return a JSON map containing proper data', () async {
    // arrange

    // act
    final result = tProductionCompanyModel.toJson();
    // assert
    final expectedJsonMap = {
      "id": 1,
      "name": 'Name',
      "logoPath": 'logoPath',
      "originCountry": 'en',
    };
    expect(result, expectedJsonMap);
  });
}
