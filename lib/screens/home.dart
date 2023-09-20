import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/brew.dart';
import 'package:flutter_application_3/models/usermodel.dart';
import 'package:flutter_application_3/services/auth.dart';
import 'package:flutter_application_3/services/database.dart';
import 'package:flutter_application_3/widgets/brewlist.dart';
import 'package:flutter_application_3/widgets/settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: camel_case_types
class home extends StatelessWidget {
  home({super.key});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<customuser?>(context);
    // ignore: no_leading_underscores_for_local_identifiers
    void _showModalBottomSheet(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return const SettingsForm();
          });
    }

    return StreamProvider<List<Brew>?>.value(
      value: DataBaseService(uid: " ").brews,
      initialData: null,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: "Brew Crew"
              .text
              .color(Vx.white)
              .textStyle(GoogleFonts.italiana())
              .semiBold
              .size(25)
              .make(),
          backgroundColor: const Color.fromARGB(155, 37, 21, 16),
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(185, 15, 5, 1),
          child: ListView(
            children: [
              StreamBuilder<UserData>(
                  stream: DataBaseService(uid: user!.uid).userdata,
                  builder: (context, snapshot) {
                    final String userName = snapshot.data?.name ?? '';
                    return DrawerHeader(
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/avatar.png"),
                            radius: 45,
                          ),
                          const SizedBox(height: 15),
                          userName.text.size(20).color(Vx.white).makeCentered(),
                        ],
                      ),
                    );
                  }),
              ListTile(
                leading: const Icon(Icons.edit),
                iconColor: Vx.white,
                title: "Customize Brew\nPreferences"
                    .text
                    .size(15)
                    .color(Vx.white)
                    .make(),
                onTap: () {
                  _showModalBottomSheet(context);
                },
              ).px8(),
              ListTile(
                leading: const Icon(CupertinoIcons.globe),
                iconColor: Vx.white,
                title: "App Language".text.size(15).color(Vx.white).make(),
                onTap: () {},
              ).px8(),
              ListTile(
                leading: const Icon(Icons.people_alt_sharp),
                iconColor: Vx.white,
                title: "Invite Friends".text.size(15).color(Vx.white).make(),
                onTap: () {},
              ).px8(),
              ListTile(
                leading: const Icon(Icons.coffee),
                iconColor: Vx.white,
                title: "Brew Tails".text.size(15).color(Vx.white).make(),
                onTap: () {},
              ).px8(),
              ListTile(
                leading: const Icon(Icons.report),
                iconColor: Vx.white,
                title: "Feedback".text.size(15).color(Vx.white).make(),
                onTap: () {},
              ).px8(),
              ListTile(
                leading: const Icon(Icons.help),
                iconColor: Vx.white,
                title: "Help and Support".text.size(15).color(Vx.white).make(),
                onTap: () {},
              ).px8(),
              ListTile(
                leading: const Icon(CupertinoIcons.left_chevron),
                iconColor: Vx.white,
                title: "Sign Out".text.size(15).color(Vx.white).make(),
                onTap: () async {
                  _auth.SignOut();
                },
              ).px8(),
            ],
          ),
        ),
        body: const BrewList(),
      ),
    );
  }
}
