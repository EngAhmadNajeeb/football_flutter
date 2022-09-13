import 'package:flutter/material.dart';
import 'package:football_flutter/models/lineup_models/player_colore_model.dart';
import 'package:football_flutter/models/lineup_models/player_model.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard(
      {Key? key, required this.player, required this.playerColores})
      : super(key: key);
  final PlayerModel player;
  final PlayerColoreModel playerColores;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color:
            Color(int.tryParse('0XFF${playerColores.primary}') ?? 0xFF000000),
        border: Border.all(
          width: 3,
          color:
              Color(int.tryParse('0XFF${playerColores.border}') ?? 0xFF000000),
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: Text(
          "${player.number}",
          style: TextStyle(
            color: Color(
                int.tryParse('0XFF${playerColores.number}') ?? 0xFF000000),
          ),
        ),
      ),
    );
  }
}
