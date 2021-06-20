import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../details/page/details_page.dart';
import '../../pokemon/controller/pokemon_controller.dart';
import 'widgets/float_action_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonController>(
      builder: (context, controller, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pokémon App'),
            backgroundColor: Colors.cyan,
          ),
          body: controller.loading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemCount: controller.pokemonList.length,
                  itemBuilder: (context, index) {
                    final pokemon = controller.pokemonList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetailsPage(pokemon: pokemon),
                          ),
                        );
                      },
                      child: Hero(
                        tag: pokemon.id,
                        child: Card(
                          key: ValueKey(pokemon.id),
                          elevation: 3.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 100.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(pokemon.img),
                                  ),
                                ),
                              ),
                              Text(
                                pokemon.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
          floatingActionButton: HomeFloatingActionButton(
            onPressed: () {
              controller.getData();
            },
          ),
        );
      },
    );
  }
}
