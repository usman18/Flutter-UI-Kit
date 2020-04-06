import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart';
import 'package:pokemon_app/model/pokemon.dart';
import 'package:pokemon_app/network_utils/pokemon_utils.dart';
import 'package:pokemon_app/ui/pokemon_detail_screen.dart';
import 'package:pokemon_app/ui/widgets/pokemon_widget.dart';

import '../pokemon_cache.dart';

class PokemonsScreen extends StatefulWidget {
  @override
  _PokemonsScreenState createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {

  bool pokemonsFetched = false;
  Pokemons pokemons;

  @override
  void initState() {
    super.initState();
    PokemonUtils.getPokemons()
      .then((res) {
        Response response = res;
        print(response.statusCode);
        pokemons = pokemonsFromJson(response.body);
        PokemonCache.pokemonsList = pokemons;
        setState(() {
          pokemonsFetched = true;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon"),
      ),
      body: pokemonsFetched ? _buildUI() : Center(
        child: CircularProgressIndicator(),
      )
    );
  }

  Widget _buildUI() {
    return GridView.count(crossAxisCount: 2,
      childAspectRatio: 0.62,
      mainAxisSpacing: 4,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(4),
      children: pokemons.pokemonList.map((pokemon) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => PokemonDetailScreen(
              pokemon: pokemon,
            )));
          },
          child: PokemonWidget(
            pokemon: pokemon,
          ),
        );
      }).toList(),
    );
  }


}


