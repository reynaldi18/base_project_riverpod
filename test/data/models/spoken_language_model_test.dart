import 'package:base_project_riverpod/src/features/movies/domain/entities/spoken_language.dart';
import 'package:base_project_riverpod/src/models/spoken_language_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tSpokenLanguageModel = SpokenLanguageModel(
    englishName: 'english',
    iso6391: 'iso',
    name: 'Name',
  );

  const tSpokenLanguage = SpokenLanguage(
    englishName: 'english',
    iso6391: 'iso',
    name: 'Name',
  );

  test('should be a subclass of ProductionCompany entity', () async {
    final result = tSpokenLanguageModel.toEntity();
    expect(result, tSpokenLanguage);
  });

  test('should return a JSON map containing proper data', () async {
    // arrange

    // act
    final result = tSpokenLanguageModel.toJson();
    // assert
    final expectedJsonMap = {
      "iso6391": 'iso',
      "englishName": 'english',
      "name": 'Name',
    };
    expect(result, expectedJsonMap);
  });
}
