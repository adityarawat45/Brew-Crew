// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/brew.dart';
import 'package:velocity_x/velocity_x.dart';

class BrewTile extends StatefulWidget {
  const BrewTile({super.key, required this.brew});
  final Brew brew;

  @override
  State<BrewTile> createState() => _BrewTileState();
}

class _BrewTileState extends State<BrewTile> {
  // ignore: non_constant_identifier_names
  bool LikeIcon = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Card(
        color: const Color.fromARGB(147, 255, 255, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[widget.brew.strength],
            backgroundImage: const AssetImage("assets/tpicon.png"),
          ),
          title: Text(widget.brew.name),
          subtitle: Text('Takes ${widget.brew.sugars} sugars'),
          trailing: InkWell(
            onTap: () => setState(() {
              LikeIcon = !LikeIcon;
            }),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 35,
              width: 35,
              color: const Color.fromARGB(0, 233, 30, 98),
              child: LikeIcon
                  ? const Icon(
                      CupertinoIcons.heart_solid,
                      size: 34,
                      color: Color.fromARGB(255, 247, 59, 59),
                    )
                  : const Icon(
                      CupertinoIcons.heart,
                      size: 34,
                      color: Vx.white,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
