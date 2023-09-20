// ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/services/auth.dart';
import 'package:flutter_application_3/shared/loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.toggleview});
  final Function toggleview;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = " ";
  String password = " ";
  String error = "";
  dynamic result;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
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
      child: loading
          ? const Loading()
          : Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
              appBar: AppBar(
                actions: [
                  InkWell(
                    onTap: () {
                      widget.toggleview();
                    },
                    child: Row(
                      children: [
                        "Sign In".text.color(Vx.white).make(),
                        const Icon(CupertinoIcons.person),
                      ],
                    ).px12(),
                  ),
                ],

                // elevation: 0,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(39, 18, 13, 11),
                    Color.fromARGB(9, 84, 65, 59),
                    Color.fromARGB(44, 18, 13, 11),
                  ])),
                ),
                backgroundColor: const Color.fromARGB(155, 37, 21, 16),
                title: "Brew Crew"
                    .text
                    .color(Vx.white)
                    .textStyle(GoogleFonts.italiana())
                    .semiBold
                    .size(25)
                    .make(),
              ),
              // ignore: avoid_unnecessary_containers
              body: Container(
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color.fromARGB(84, 255, 255, 255),
                            ),
                            child: TextFormField(
                              validator: (value) =>
                                  value!.isEmpty ? "Enter a valid email" : null,
                              decoration: const InputDecoration(
                                  alignLabelWithHint: true,
                                  icon: Icon(CupertinoIcons.mail_solid),
                                  border: InputBorder.none,
                                  hintText: "Enter your email"),
                              onChanged: (value) {
                                setState(() => email = value);
                              },
                            ).px16()),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(84, 255, 255, 255),
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              validator: (value) => value!.length < 6
                                  ? "Password should be longer"
                                  : null,
                              decoration: const InputDecoration(
                                  alignLabelWithHint: true,
                                  hintStyle: TextStyle(),
                                  hintText: "Enter your password",
                                  icon: Icon(CupertinoIcons.padlock),
                                  border: InputBorder.none),
                              obscureText: true,
                              onChanged: (value) {
                                setState(() => password = value);
                              },
                            ).px16()),
                        const SizedBox(
                          height: 34,
                        ),
                        Container(
                          height: 35,
                          width: 85,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  result = await _auth.emailregistration(
                                      email, password);
                                  loading = false;
                                }
                                if (result == null) {
                                  setState(() {
                                    error = "Please enter a valid email";
                                  });
                                  loading = false;
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: "Register"
                                  .text
                                  .color(Colors.black)
                                  .bold
                                  .makeCentered()),
                        )
                      ],
                    ).p64()),
              )),
    );
  }
}
