import 'package:base_project_riverpod/src/features/movies/domain/entities/belongs_to_collection.dart';
import 'package:base_project_riverpod/src/models/belongs_to_collection_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tBelongToCollectionModel = BelongsToCollectionModel(
    id: 1,
    name: 'Name',
    posterPath: 'posterPath',
    backdropPath: 'backdropPath',
  );

  const tBelongToCollection = BelongsToCollection(
    id: 1,
    name: 'Name',
    posterPath: 'posterPath',
    backdropPath: 'backdropPath',
  );

  test('should be a subclass of BelongToCollection entity', () async {
    final result = tBelongToCollectionModel.toEntity();
    expect(result, tBelongToCollection);
  });

  test('should return a JSON map containing proper data', () async {
    // arrange

    // act
    final result = tBelongToCollectionModel.toJson();
    // assert
    final expectedJsonMap = {
      "id": 1,
      "name": 'Name',
      "poster_path": 'posterPath',
      "backdrop_path": 'backdropPath',
    };
    expect(result, expectedJsonMap);
  });
}
