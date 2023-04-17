import 'package:base_project_riverpod/src/features/movies/domain/entities/genre.dart';
import 'package:base_project_riverpod/src/models/genre_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tGenreModel = GenreModel(
    id: 1,
    name: 'Name',
  );

  const tGenre = Genre(
    id: 1,
    name: 'Name',
  );

  test('should be a subclass of Genre entity', () async {
    final result = tGenreModel.toEntity();
    expect(result, tGenre);
  });

  test('should return a JSON map containing proper data', () async {
    // arrange

    // act
    final result = tGenreModel.toJson();
    // assert
    final expectedJsonMap = {
      "id": 1,
      "name": 'Name',
    };
    expect(result, expectedJsonMap);
  });
}
