

import 'package:http/http.dart';

class PokemonUtils {

    static Future<Response> getPokemons() async{
        String apiUrl = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
        Response response = await get(apiUrl);
        return response;
    }


}