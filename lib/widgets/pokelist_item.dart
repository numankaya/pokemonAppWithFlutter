import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/constants/ui_helper.dart';
import 'package:pokemon_app/model/pokemon_model.dart';

import '../constants/constants.dart';
import 'poke_img_and_ball.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
      elevation: 3,
      shadowColor: Colors.white,
      color: UIHelper.getColorFromType(pokemon.type![0]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pokemon.name ?? 'N/A',
            style: Constants.getPokemonNameTextStyle(),
          ),
          Chip(label: Text(pokemon.type![0])),
          Expanded(child: PokeImageAndBall(pokemon: pokemon)),
        ],
      ),
    );
  }
}
