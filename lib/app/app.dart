import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pokemon/controller/pokemon_controller.dart';
import '../pokemon/pages/home/home_page.dart';
import '../pokemon/services/api/api_caller.dart';
import '../pokemon/services/pokemon_service.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PokemonController(PokemonService(ApiCaller())),
      child: MaterialApp(
        title: 'Pokémon App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.cyan,
          accentColor: Colors.amber,
          backgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
