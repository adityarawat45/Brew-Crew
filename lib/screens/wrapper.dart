// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/usermodel.dart';
import 'package:flutter_application_3/screens/authenticate.dart';
import 'package:flutter_application_3/screens/home.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  const wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<customuser?>(context);
    if (user == null) {
      return authenticate();
    } else {
      return home();
    }
  }
}
