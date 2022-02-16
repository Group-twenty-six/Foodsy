// ignore_for_file: unnecessary_const

import 'dart:io';
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/material.dart';
import 'package:market/manager/Views/CashFlow.dart';
import 'package:market/manager/Views/Orders.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth managerAuth = FirebaseAuth.instance;
  void userLogout() async {
    await managerAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("copy board"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('Orders'),
              ),
              const Tab(
                child: Text('Cash Flow'),
              )
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        body: TabBarView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Orders(),
            const CashFlow(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("${managerAuth.currentUser?.email}"),
                accountEmail: const Text(""),
              ),
              ListTile(
                title: const Text("Logout"),
                onTap: () => userLogout(),
              ),
              ListTile(
                title: const Text("Exit App"),
                onTap: () => exit(0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
