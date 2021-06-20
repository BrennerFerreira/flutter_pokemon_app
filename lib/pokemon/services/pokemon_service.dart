import '../../pokemon/services/api/api_caller.dart';
import '../controller/pokemon_service_interface.dart';
import '../entities/pokemon.dart';

class PokemonService implements PokemonServiceInterface {
  final ApiCaller _apiCaller;
  PokemonService(this._apiCaller);

  @override
  Future<List<Pokemon>> getPokemonList() async {
    try {
      final response = await _apiCaller.getData<Map<String, dynamic>>();

      final pokemonList = Pokemon.fromJsonList(response.payload);
      return pokemonList;
    } on ApiCallException {
      return [];
    }
  }
}
