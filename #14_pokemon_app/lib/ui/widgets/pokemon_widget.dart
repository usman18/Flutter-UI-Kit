import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon.dart';

import '../../constants.dart';

const kTextStyle = TextStyle(
  fontSize: 15,
  color: Colors.white,
);

class PokemonWidget extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonWidget({Key key, this.pokemon}) : super(key: key);

  @override
  _PokemonWidgetState createState() => _PokemonWidgetState();
}

class _PokemonWidgetState extends State<PokemonWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Hero(
            tag: widget.pokemon.id,
            child: CachedNetworkImage(
              imageUrl: widget.pokemon.img,
              placeholder: (context, url) => Container(child: LinearProgressIndicator(),
                margin: EdgeInsets.all(24),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16),
                topRight: Radius.circular(24)
              ),
              color: kPrimaryColor,
            ),
            child: Wrap(
              spacing: 5,
              direction: Axis.vertical,
              children: <Widget>[
                Text(widget.pokemon.name,
                  maxLines: 1,
                  style: kTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text("Height ${widget.pokemon.height}", style: kTextStyle,),
                Text("Weight ${widget.pokemon.weight}", style: kTextStyle,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
