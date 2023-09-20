import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDark extends StatelessWidget {
  const LoadingDark({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitThreeBounce(
        color: Colors.brown,
        size: 40.0,
      ),
    );
  }
}
