import 'package:base_project_riverpod/src/features/movies/data/services/movie_service.dart';
import 'package:base_project_riverpod/src/features/movies/domain/repositories/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  MovieRepository,
  MovieService,
], customMocks: [
  MockSpec<Dio>(as: #MockDioClient)
])
void main() {}
