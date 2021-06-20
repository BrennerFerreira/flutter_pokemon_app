import 'package:flutter/material.dart';

import '../../pokemon/controller/pokemon_service_interface.dart';
import '../entities/pokemon.dart';

class PokemonController with ChangeNotifier {
  final PokemonServiceInterface _service;

  PokemonController(this._service) {
    if (pokemonList.isEmpty) {
      getData();
    }
  }

  List<Pokemon> pokemonList = [];

  bool _loading = true;
  bool get loading => _loading;

  void setLoading({required bool newLoadingState}) {
    _loading = newLoadingState;
    notifyListeners();
  }

  Future<void> getData() async {
    setLoading(newLoadingState: true);
    final fetchedPokemonList = await _service.getPokemonList();
    pokemonList = fetchedPokemonList;
    setLoading(newLoadingState: false);
    notifyListeners();
  }

  Pokemon findPokemonByNumber({required String pokemonNum}) {
    return pokemonList.firstWhere((pokemon) => pokemon.num == pokemonNum);
  }
}
