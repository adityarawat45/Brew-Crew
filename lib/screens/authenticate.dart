// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/register.dart';
import 'package:flutter_application_3/screens/SignIn.dart';

class authenticate extends StatefulWidget {
  const authenticate({super.key});

  @override
  State<authenticate> createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {
  bool showSignIn = true;

  void toggleview() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    if (showSignIn) {
      return SignIn(toggleview: toggleview);
    } else {
      return Register(toggleview: toggleview);
    }
  }
}
