import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:market/Global/Router.dart';
import 'package:market/UserAuth.dart';
import 'package:market/manager/Auth/Authorize.dart';

class Roles extends StatefulWidget {
  const Roles({Key? key}) : super(key: key);

  @override
  _RolesState createState() => _RolesState();
}

class _RolesState extends State<Roles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Roles"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              AvatarGlow(
                  glowColor: Colors.red,
                  curve: Curves.bounceInOut,
                  child: TextButton(
                    onPressed: () {
                      routesPage(context, const ManagerAuth());
                    },
                    child: const CircleAvatar(
                      radius: 60,
                      child: Text('Manager'),
                    ),
                  ),
                  endRadius: 100),
              const Text(""),
              AvatarGlow(
                  // ignore: prefer_const_constructors
                  duration: Duration(
                    milliseconds: 2500,
                  ),
                  glowColor: Colors.red,
                  curve: Curves.bounceOut,
                  child: TextButton(
                    onPressed: () => routesPage(context, const UserAuth()),
                    child: const CircleAvatar(
                      radius: 60,
                      child: Text('Client'),
                    ),
                  ),
                  endRadius: 100),
            ],
          ),
        ),
      ),
    );
  }
}
