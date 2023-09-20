import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/brew.dart';
import 'package:flutter_application_3/screens/Brewtile.dart';
import 'package:flutter_application_3/shared/loading.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);
    // if (brews != null) {
    //   brews.forEach((brew) {
    //     print(brew.name);
    //     print(brew.sugars);
    //     print(brew.strength);
    //   });
    // }
    if (brews != null) {
      // ignore: avoid_unnecessary_containers
      return Container(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(colors: [
          //   Color.fromARGB(39, 18, 13, 11),
          //   Color.fromARGB(9, 84, 65, 59),
          //   Color.fromARGB(44, 18, 13, 11),
          // ]),
          image: DecorationImage(
              image: AssetImage('assets/pxfuel.jpg'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high),
        ),
        child: ListView.builder(
          itemCount: brews.length,
          itemBuilder: (context, index) {
            return BrewTile(brew: brews[index]);
          },
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(colors: [
          //   Color.fromARGB(39, 18, 13, 11),
          //   Color.fromARGB(9, 84, 65, 59),
          //   Color.fromARGB(44, 18, 13, 11),
          // ]),
          image: DecorationImage(
              image: AssetImage('assets/pxfuel.jpg'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high),
        ),
        child: const Loading(),
      );
    }
  }
}
