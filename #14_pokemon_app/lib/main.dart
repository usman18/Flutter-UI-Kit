import 'package:flutter/material.dart';
import 'package:pokemon_app/ui/pokemons_screen.dart';

import 'constants.dart';

void main() {
  runApp(PokemonApp());
}


class PokemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor
      ),
      home: PokemonsScreen(),
    );
  }
}
