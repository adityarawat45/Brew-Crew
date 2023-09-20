import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitThreeBounce(
        color: Color.fromARGB(255, 255, 255, 255),
        size: 40.0,
      ),
    );
  }
}
