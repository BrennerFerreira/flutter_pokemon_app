import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/pokemon_controller.dart';
import '../../../entities/pokemon.dart';
import '../details_page.dart';

class PageBody extends StatelessWidget {
  final Pokemon pokemon;

  const PageBody({Key? key, required this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height * (2 / 3),
          width: MediaQuery.of(context).size.width * 0.9,
          left: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * (1 / 6),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * (1 / 24),
                ),
                Text(
                  pokemon.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Height: ${pokemon.height}"),
                Text("Weight: ${pokemon.weight}"),
                const Text(
                  "Types",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map(
                        (type) => Chip(
                          label: Text(type),
                          backgroundColor: Theme.of(context).accentColor,
                        ),
                      )
                      .toList(),
                ),
                const Text(
                  "Weaknesses",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses
                      .map(
                        (weakness) => Chip(
                          label: Text(weakness),
                          backgroundColor: Theme.of(context).accentColor,
                        ),
                      )
                      .toList(),
                ),
                if (pokemon.prevEvolution != null &&
                    pokemon.prevEvolution!.isNotEmpty)
                  const Text(
                    "Previous Evolutions",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (pokemon.prevEvolution != null &&
                    pokemon.prevEvolution!.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution!
                        .map(
                          (evolution) => InkWell(
                            onTap: () {
                              final evolutionPokemon = context
                                  .read<PokemonController>()
                                  .findPokemonByNumber(
                                      pokemonNum: evolution.num);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      DetailsPage(pokemon: evolutionPokemon),
                                ),
                              );
                            },
                            child: Chip(
                              label: Text(evolution.name),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                if (pokemon.nextEvolution != null &&
                    pokemon.nextEvolution!.isNotEmpty)
                  const Text(
                    "Next Evolutions",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (pokemon.nextEvolution != null &&
                    pokemon.nextEvolution!.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution!
                        .map(
                          (evolution) => InkWell(
                            onTap: () {
                              final evolutionPokemon = context
                                  .read<PokemonController>()
                                  .findPokemonByNumber(
                                      pokemonNum: evolution.num);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      DetailsPage(pokemon: evolutionPokemon),
                                ),
                              );
                            },
                            child: Chip(
                              label: Text(evolution.name),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.id,
            child: Container(
              height: MediaQuery.of(context).size.height * (1 / 4),
              width: MediaQuery.of(context).size.height * (1 / 4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(pokemon.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
