import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/pokemon/entities/pokemon.dart';
import '../../mock/pokemon_list_mock.dart';
import '../../mock/pokemon_mock.dart';
import './../../mock/evolution_mock.dart';

void main() {
  group('evolutions', () {
    late Map<String, dynamic> mockJson;
    setUp(() async {
      final file = File('test/mock/evolution_mock.json');
      mockJson = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    });

    test('should return a PrevEvolution class', () {
      // arrange
      final expectedPrevEvolution = EvolutionMock.prevEvolution;
      // act
      final result = PrevEvolution.fromJson(mockJson);
      // assert
      expect(result, isA<PrevEvolution>());
      expect(result.num, equals(expectedPrevEvolution.num));
      expect(result.name, equals(expectedPrevEvolution.name));
    });

    test('should return a NextEvolution class', () {
      // arrange
      final expectedNextEvolution = EvolutionMock.nextEvolution;
      // act
      final result = NextEvolution.fromJson(mockJson);
      // assert
      expect(result, isA<NextEvolution>());
      expect(result.num, expectedNextEvolution.num);
      expect(result.name, expectedNextEvolution.name);
    });
  });

  group('Pokemon class', () {
    test('should return a Pokemon instance', () async {
      // arrange
      late Map<String, dynamic> mockPokemonCompleteJson;
      final file = File('test/mock/pokemon_complete.json');
      mockPokemonCompleteJson =
          jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      final expectedPokemon = PokemonMock.pokemonCompleteMock;

      // act
      final result = Pokemon.fromJson(mockPokemonCompleteJson);

      // assert
      expect(result, isA<Pokemon>());
      expect(result.id, equals(expectedPokemon.id));
      expect(result.name, equals(expectedPokemon.name));
      expect(result.num, equals(expectedPokemon.num));
      expect(result.avgSpawns, equals(expectedPokemon.avgSpawns));
      expect(result.candy, equals(expectedPokemon.candy));
      expect(result.candyCount, equals(expectedPokemon.candyCount));
      expect(result.egg, equals(expectedPokemon.egg));
      expect(result.height, equals(expectedPokemon.height));
      expect(result.img, equals(expectedPokemon.img));
      expect(result.multipliers, equals(expectedPokemon.multipliers));
      expect(result.nextEvolution, isA<List<NextEvolution>>());
      expect(result.nextEvolution?.length,
          equals(expectedPokemon.nextEvolution?.length));
      expect(result.prevEvolution, isA<List<PrevEvolution>>());
      expect(result.prevEvolution?.length,
          equals(expectedPokemon.prevEvolution?.length));
      expect(result.spawnTime, equals(expectedPokemon.spawnTime));
      expect(result.spawnChance, equals(expectedPokemon.spawnChance));
      expect(result.type, equals(expectedPokemon.type));
      expect(result.weaknesses, equals(expectedPokemon.weaknesses));
      expect(result.weight, equals(expectedPokemon.weight));
    });

    test('should return a Pokemon instance when json has no multipliers field',
        () async {
      // arrange
      late Map<String, dynamic> mockPokemonWithoutMultipliersJson;
      final file = File('test/mock/pokemon_without_multipliers_mock.json');
      mockPokemonWithoutMultipliersJson =
          jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      final expectedPokemon = PokemonMock.pokemonWithoutMultipliersMock;

      // act
      final result = Pokemon.fromJson(mockPokemonWithoutMultipliersJson);

      // assert
      expect(result, isA<Pokemon>());
      expect(result.id, equals(expectedPokemon.id));
      expect(result.name, equals(expectedPokemon.name));
      expect(result.num, equals(expectedPokemon.num));
      expect(result.avgSpawns, equals(expectedPokemon.avgSpawns));
      expect(result.candy, equals(expectedPokemon.candy));
      expect(result.candyCount, equals(expectedPokemon.candyCount));
      expect(result.egg, equals(expectedPokemon.egg));
      expect(result.height, equals(expectedPokemon.height));
      expect(result.img, equals(expectedPokemon.img));
      expect(result.multipliers, equals(expectedPokemon.multipliers));
      expect(result.nextEvolution, isA<List<NextEvolution>>());
      expect(result.nextEvolution?.length,
          equals(expectedPokemon.nextEvolution?.length));
      expect(result.prevEvolution, isA<List<PrevEvolution>>());
      expect(result.prevEvolution?.length,
          equals(expectedPokemon.prevEvolution?.length));
      expect(result.spawnTime, equals(expectedPokemon.spawnTime));
      expect(result.spawnChance, equals(expectedPokemon.spawnChance));
      expect(result.type, equals(expectedPokemon.type));
      expect(result.weaknesses, equals(expectedPokemon.weaknesses));
      expect(result.weight, equals(expectedPokemon.weight));
    });

    test(
        'should return a Pokemon instance when json has no prevEvolution field',
        () async {
      // arrange
      late Map<String, dynamic> mockPokemonWithoutPrevEvolutionJson;
      final file = File('test/mock/pokemon_without_prev_evolution_mock.json');
      mockPokemonWithoutPrevEvolutionJson =
          jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      final expectedPokemon = PokemonMock.pokemonWithoutPrevEvolutionMock;

      // act
      final result = Pokemon.fromJson(mockPokemonWithoutPrevEvolutionJson);

      // assert
      expect(result, isA<Pokemon>());
      expect(result.id, equals(expectedPokemon.id));
      expect(result.name, equals(expectedPokemon.name));
      expect(result.num, equals(expectedPokemon.num));
      expect(result.avgSpawns, equals(expectedPokemon.avgSpawns));
      expect(result.candy, equals(expectedPokemon.candy));
      expect(result.candyCount, equals(expectedPokemon.candyCount));
      expect(result.egg, equals(expectedPokemon.egg));
      expect(result.height, equals(expectedPokemon.height));
      expect(result.img, equals(expectedPokemon.img));
      expect(result.multipliers, equals(expectedPokemon.multipliers));
      expect(result.nextEvolution, isA<List<NextEvolution>>());
      expect(result.nextEvolution?.length,
          equals(expectedPokemon.nextEvolution?.length));
      expect(result.prevEvolution, isA<List<PrevEvolution>>());
      expect(result.prevEvolution?.length,
          equals(expectedPokemon.prevEvolution?.length));
      expect(result.spawnTime, equals(expectedPokemon.spawnTime));
      expect(result.spawnChance, equals(expectedPokemon.spawnChance));
      expect(result.type, equals(expectedPokemon.type));
      expect(result.weaknesses, equals(expectedPokemon.weaknesses));
      expect(result.weight, equals(expectedPokemon.weight));
    });

    test(
        'should return a Pokemon instance when json has no nextEvolution field',
        () async {
      // arrange
      late Map<String, dynamic> mockPokemonWithoutNextEvolutionJson;
      final file = File('test/mock/pokemon_without_next_evolution_mock.json');
      mockPokemonWithoutNextEvolutionJson =
          jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      final expectedPokemon = PokemonMock.pokemonWithoutNextEvolutionMock;

      // act
      final result = Pokemon.fromJson(mockPokemonWithoutNextEvolutionJson);

      // assert
      expect(result, isA<Pokemon>());
      expect(result.id, equals(expectedPokemon.id));
      expect(result.name, equals(expectedPokemon.name));
      expect(result.num, equals(expectedPokemon.num));
      expect(result.avgSpawns, equals(expectedPokemon.avgSpawns));
      expect(result.candy, equals(expectedPokemon.candy));
      expect(result.candyCount, equals(expectedPokemon.candyCount));
      expect(result.egg, equals(expectedPokemon.egg));
      expect(result.height, equals(expectedPokemon.height));
      expect(result.img, equals(expectedPokemon.img));
      expect(result.multipliers, equals(expectedPokemon.multipliers));
      expect(result.nextEvolution, isA<List<NextEvolution>>());
      expect(result.nextEvolution?.length,
          equals(expectedPokemon.nextEvolution?.length));
      expect(result.prevEvolution, isA<List<PrevEvolution>>());
      expect(result.prevEvolution?.length,
          equals(expectedPokemon.prevEvolution?.length));
      expect(result.spawnTime, equals(expectedPokemon.spawnTime));
      expect(result.spawnChance, equals(expectedPokemon.spawnChance));
      expect(result.type, equals(expectedPokemon.type));
      expect(result.weaknesses, equals(expectedPokemon.weaknesses));
      expect(result.weight, equals(expectedPokemon.weight));
    });

    test('should return a list of Pokemon instances from Json', () async {
      // arrange
      late Map<String, dynamic> mockPokemonListJson;
      final file = File('test/mock/pokemon_list_mock.json');
      mockPokemonListJson =
          jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      final expectedPokemonList = PokemonListMock.pokemonListMock;
      // act
      final result = Pokemon.fromJsonList(mockPokemonListJson);
      // assert
      expect(result, isA<List<Pokemon>>());
      expect(result.length, equals(expectedPokemonList.length));
    });
  });
}
