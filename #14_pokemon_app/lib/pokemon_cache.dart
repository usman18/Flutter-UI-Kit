import 'package:pokemon_app/model/pokemon.dart';

class PokemonCache {

  static Pokemons pokemonsList;

  static Pokemon getPokemon(int id) {
    List<Pokemon> pokemons = pokemonsList.pokemonList;
    return pokemons.firstWhere((pokemon) => pokemon.id == id, orElse: () => null);
  }


}