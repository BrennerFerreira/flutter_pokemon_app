import '../entities/pokemon.dart';

abstract class PokemonServiceInterface {
  Future<List<Pokemon>> getPokemonList();
}
