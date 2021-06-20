import 'package:flutter/material.dart';
import '../../pokemon/entities/pokemon.dart';
import 'widgets/page_body.dart';

class DetailsPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailsPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: PageBody(pokemon: pokemon),
    );
  }
}
