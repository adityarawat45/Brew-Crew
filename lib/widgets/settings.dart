// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/usermodel.dart';
import 'package:flutter_application_3/services/database.dart';

import 'package:flutter_application_3/shared/loading_dark.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];
  late String _currentname = "";
  late String _currentsugars = "";
  late int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<customuser?>(context);
    return StreamBuilder<UserData>(
        stream: DataBaseService(uid: user!.uid).userdata,
        builder: (context, data) {
          if (data.hasData) {
            return Form(
              key: formkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  "Update your brew settings".text.size(20).make(),
                  const SizedBox(height: 20.0),
                  Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.brown[100],
                      ),
                      child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Update your name",
                              labelStyle: TextStyle(),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 25)),
                          validator: (value) =>
                              value!.isEmpty ? 'Please enter a name' : null,
                          onChanged: (value) => setState(
                                () => _currentname = value,
                              ))),
                  const SizedBox(
                    height: 10,
                  ),
                  //dropdown
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.brown[100],
                    ),
                    child: DropdownButtonFormField(
                        // value: _currentsugars ?? userdt!.sugars,
                        decoration: const InputDecoration(
                            labelText: "Choose your sugar level",
                            labelStyle: TextStyle(),
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 25)),
                        items: sugars
                            .map(
                              (sugar) => DropdownMenuItem(
                                value: sugar,
                                child: Text("$sugar sugars"),
                              ),
                            )
                            .toList(),
                        onChanged: (value) => setState(
                              () => _currentsugars = value as String,
                            )),
                  ),
                  //
                  Slider(
                          value: (_currentStrength).toDouble(),
                          min: 100.0,
                          max: 900.0,
                          divisions: 8,
                          activeColor: Colors.brown[_currentStrength],
                          inactiveColor: Colors.brown,
                          onChanged: ((value) =>
                              setState(() => _currentStrength = value.round())))
                      .p16(),
                  SizedBox(
                    height: 15,
                  ),

                  //button
                  ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await DataBaseService(uid: user.uid).updateUserData(
                            _currentsugars, _currentname, _currentStrength);
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.brown),
                    ),
                    child: "Update".text.make(),
                  )
                ],
              ),
            );
          } else {
            return LoadingDark();
          }
        });
  }
}
