import 'package:flutter/material.dart';
import 'package:sdeng/model/athlete.dart';

/// ListTile specific for players, with player number in the leading icon
/// and forwarding arrow in the trailing
/// This tile is Slide-To-Delete
class PlayerTileWidget extends StatelessWidget {
  const PlayerTileWidget({
    Key? key,
    required this.athlete,
    required this.onTap,
  }) : super(key: key);

  final Athlete athlete;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      leading: Text(
        '${athlete.number}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Color(0xff4D46B2),
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Color(0xff4D46B2),
      ),
      title: Text(
        '${athlete.name} ${athlete.surname}',
        style: const TextStyle(
          fontSize: 20.0,
          color: Color(0xff4D46B2),
        ),
      ),
      onTap: onTap
    );
  }
}