import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_app/pokemon/entities/pokemon.dart';
import 'package:pokemon_app/pokemon/services/api/api_caller.dart';
import 'package:pokemon_app/pokemon/services/api/api_response.dart';
import 'package:pokemon_app/pokemon/services/pokemon_service.dart';

import '../../mock/pokemon_list_mock.dart';
import 'pokemon_services_test.mocks.dart';

@GenerateMocks([ApiCaller])
void main() {
  group('getData', () {
    late PokemonService service;
    late MockApiCaller apiCaller;
    late Map<String, dynamic> mockPokemonListJson;
    late List<Pokemon> expectedPokemonList;

    setUp(() async {
      apiCaller = MockApiCaller();
      service = PokemonService(apiCaller);
    });
    test('should return a list of Pokemon when api responds successfully',
        () async {
      // arrange
      final file = File('test/mock/pokemon_list_mock.json');
      mockPokemonListJson =
          jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      expectedPokemonList = PokemonListMock.pokemonListMock;
      when(apiCaller.getData()).thenAnswer(
        (_) async => ApiResponse<Map<String, dynamic>>(
          success: true,
          payload: mockPokemonListJson,
        ),
      );

      // act
      final result = await service.getPokemonList();

      // assert
      verify(apiCaller.getData()).called(1);
      verifyNoMoreInteractions(apiCaller);
      expect(result, isA<List<Pokemon>>());
      expect(result.length, expectedPokemonList.length);
      expect(result.first.id, expectedPokemonList.first.id);
      expect(result.last.id, expectedPokemonList.last.id);
    });

    test('should return an empty list when api responds with an error',
        () async {
      // arrange

      when(apiCaller.getData()).thenThrow(ApiCallException());

      // act
      final result = await service.getPokemonList();

      // assert
      verify(apiCaller.getData()).called(1);
      verifyNoMoreInteractions(apiCaller);
      expect(result, isA<List>());
      expect(result.isEmpty, true);
    });
  });
}
