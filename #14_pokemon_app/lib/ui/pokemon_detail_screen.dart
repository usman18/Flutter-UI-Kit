import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokemon_app/model/pokemon.dart';

import '../constants.dart';
import '../pokemon_cache.dart';

const kHeaderTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
);

const kBodyTextStyle = TextStyle(
  fontSize: 16,
  color: kPrimaryColor,
);

class PokemonDetailScreen extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({Key key, this.pokemon}) : super(key: key);


  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  Pokemon pokemon;
  List<Pokemon> pokemonEvolutions = [];

  PaletteGenerator _paletteGenerator;
  Color _darkVibrantColor; //will be generated from pallete generator

  bool isColorExtractedFromImage = false;

  @override
  void initState() {
    super.initState();
    pokemon = widget.pokemon;
    populatePokemonEvolutions();
    generatePallete();
  }

  void generatePallete() async {
    _paletteGenerator = await PaletteGenerator.fromImageProvider(CachedNetworkImageProvider(widget.pokemon.img), maximumColorCount: 20);

    if (_paletteGenerator != null) {
      PaletteColor paletteColor = _paletteGenerator.darkVibrantColor;
      setState(() {
        _darkVibrantColor = paletteColor?.color ?? kPrimaryColor;
        isColorExtractedFromImage = true;
      });
    } else {
      isColorExtractedFromImage = true;
      _darkVibrantColor = kPrimaryColor;         //Fall back color
    }
  }

  void populatePokemonEvolutions() {
    List<Evolution> preEvolutions = pokemon.prevEvolution;
    List<Evolution> nextEvolutions = pokemon.nextEvolution;

    preEvolutions?.forEach((evolution) {
      Pokemon pokemon = PokemonCache.getPokemon(int.parse(evolution.num));
      if (pokemon != null) {
        pokemonEvolutions.add(pokemon);
      }
    });

    nextEvolutions?.forEach((evolution) {
      Pokemon pokemon = PokemonCache.getPokemon(int.parse(evolution.num));
      if (pokemon != null) {
        pokemonEvolutions.add(pokemon);
      }
    });

    print("Evolutions length is ${pokemonEvolutions.length}");
  }

  @override
  Widget build(BuildContext context) {
    return isColorExtractedFromImage ? _buildUI() : _buildLoadingUI();
  }



  Widget _buildHeaderSection() {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: _darkVibrantColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.width))
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Hero(
            tag: pokemon.id,
            child: CachedNetworkImage(
              imageUrl: pokemon.img,
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.fill,
              placeholder: (context, url) => Container(
                child: LinearProgressIndicator(),
                margin: EdgeInsets.all(24),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPokemonTypeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Type",
            style: kBodyTextStyle.copyWith(
              fontWeight: FontWeight.w800,
              color: _darkVibrantColor,
            ),
          ),
          SizedBox(height: 4,),
          Wrap(
            children: pokemon.type.map((typeElement) {
              return Chip(
                label: Text(
                  typeValues?.reverse[typeElement]?.toString() ?? "",
                  style: kHeaderTextStyle,
                ),
                backgroundColor: _darkVibrantColor,
              );
            }).toList(),
            direction: Axis.horizontal,
            spacing: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildBioSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  pokemon.candy,
                  style: kBodyTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: _darkVibrantColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Candy",
                  style: kBodyTextStyle.copyWith(
                    fontSize: 12,
                    color: _darkVibrantColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: MediaQuery.of(context).size.height * 0.05,
            width: 2,
            color: _darkVibrantColor,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  pokemon.height,
                  style: kBodyTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: _darkVibrantColor,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Height",
                  style: kBodyTextStyle.copyWith(
                    fontSize: 12,
                    color: _darkVibrantColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: MediaQuery.of(context).size.height * 0.05,
            width: 2,
            color: _darkVibrantColor,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  pokemon.weight,
                  style: kBodyTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: _darkVibrantColor,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Weight",
                  style: kBodyTextStyle.copyWith(
                    fontSize: 12,
                    color: _darkVibrantColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeaknessesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Weakness",
            style: kBodyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: _darkVibrantColor,
            ),
          ),
          SizedBox(height: 4,),
          Wrap(
            children: pokemon.weaknesses.map((typeElement) {
              return Chip(
                label: Text(
                  typeValues?.reverse[typeElement]?.toString(),
                  style: kHeaderTextStyle,
                ),
                backgroundColor: _darkVibrantColor,
              );
            }).toList(),
            direction: Axis.horizontal,
            spacing: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildEvolutionsSection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Evolution",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: _darkVibrantColor,
            ),
          ),
          SizedBox(height: 16,),
          Wrap(
            spacing: MediaQuery.of(context).size.width * 0.2,
            direction: Axis.horizontal,
            children: pokemonEvolutions
                .map((pokemon) => Column(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: pokemon.img,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => Container(
                            child: LinearProgressIndicator(),
                            margin: EdgeInsets.only(top: 24),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        Text(
                          pokemon.name,
                          style: TextStyle(
                            color: _darkVibrantColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "#${pokemon.num}",
                          style: kBodyTextStyle.copyWith(
                            color: _darkVibrantColor,
                          ),
                        ),
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    );
  }


  Widget _buildSpawnSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Spawn Chance",
                style: kBodyTextStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  color: _darkVibrantColor,
                ),
              ),
              Text("${(pokemon.spawnChance * 100).round()} %",
                style: kBodyTextStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  color: _darkVibrantColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12,),
          LinearProgressIndicator(
            value: pokemon.spawnChance,
            valueColor: AlwaysStoppedAnimation<Color>(_darkVibrantColor),
            backgroundColor: _darkVibrantColor.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildBioSection(),
          _buildPokemonTypeSection(),
          _buildWeaknessesSection(),
          _buildSpawnSection(),
          _buildEvolutionsSection(),
        ],
      ),
    );
  }


  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Pokedex",
              style: kHeaderTextStyle,
            ),
            Text(
              pokemon.name,
              style: kHeaderTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(
          "#" + pokemon.id.toString(),
          style: kHeaderTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }



  Widget _buildUI() {
    return Scaffold(
      appBar: AppBar(
        title: _buildAppBar(),
        backgroundColor: _darkVibrantColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[_buildHeaderSection(), _buildInfoSection()],
        ),
      ),
    );
  }



  Widget _buildLoadingUI() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }





}
