// ignore_for_file: file_names, avoid_unnecessary_containers, non_constant_identifier_names

import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/database.dart';
import 'package:market/Global/Global.dart';
import 'package:market/Item/Carts.dart';
import 'package:market/Item/ItemCart.dart';
import 'package:market/QrCode/Code.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    // ignore: unused_local_variable
  }

  void signOutUser() {
    auth.signOut();
  }

  String url = "images/";
  String d_url = "images/drinks/";
  List<String> items = [
    "Beef Stew",
    "Chicken",
    "Beans",
    "Fried Fish",
    "Boiled Beef",
    "Chips",
    "Gnuts and Matooke",
    "Katogo",
    "Luwombo",
    "Spiced Fish",
    "Boiled Fish"
  ];
  List<String> urls = [
    "Beef_stew.jpg",
    "Chicken.jpg",
    "Beans.jpg",
    "FriedFish.jpg",
    "BoiledBeef.jpg",
    "Chips.jpg",
    "Gnuts_and_matooke.jpg",
    "Katogo.jpg",
    "Luwombo.png",
    "SpicedFish.jpg",
    "BoiledFish.jpg"
  ];
  List<double> drinkPrices = [4000, 3000, 3500, 5000, 5000, 4500];
  List<double> prices = [
    4000,
    3000,
    3500,
    5000,
    5000,
    4500,
    3000,
    2500,
    6000,
    5000,
    5000
  ];

  List<String> drinks = [
    "Apple Soda",
    "Coca Cola",
    "Zero Sugar",
    "Orange juice",
    "Pepsi cola",
    "Sprite"
  ];
  List<String> drinkUrl = [
    "ap.png",
    "cola.png",
    "diet.png",
    "orange.png",
    "pepsi.png",
    "sprite.png"
  ];
  String title = "Foods";
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> drawer = GlobalKey<ScaffoldState>();
    var gridView = GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      children: List.generate(
        items.length,
        (index) => ItemCart(
          imageUrl: url + urls[index],
          itemName: items[index],
          id: index,
          price: prices[index],
        ),
      ),
    );

    var gridDrinksView = GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      children: List.generate(
        drinks.length,
        (index) => ItemCart(
          imageUrl: d_url + drinkUrl[index],
          itemName: drinks[index],
          id: index,
          price: drinkPrices[index],
        ),
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: InkWell(
              child: const Icon(
                Icons.local_grocery_store_outlined,
              ),
              onTap: () {
                showCupertinoModalPopup(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    context: context,
                    builder: (context) {
                      return BottomSheet(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height),
                        backgroundColor: Colors.transparent,
                        onClosing: () {},
                        builder: (context) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 1.2,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17),
                                topRight: Radius.circular(17),
                              ),
                            ),
                            child: bottomAction(),
                          );
                        },
                      );
                    });
              },
            ),
          ),
        ],
      ),
      // ignore: prefer_const_constructors
      body: Center(
        // ignore: prefer_const_constructors
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: title == "Foods" ? gridView : gridDrinksView,
        ),
      ),
      drawer: Drawer(
        key: drawer,
        child: Container(
          padding: EdgeInsets.zero,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text("Foodsy"),
                accountEmail: Text("${auth.currentUser?.email}"),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    title = "Foods";
                  });
                },

                title: const Text("Foods"),
                // ignore: prefer_const_constructors
                leading: Icon(
                  Icons.food_bank_rounded,
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    title = "Drinks";
                  });
                },

                title: const Text("Drinks"),
                // ignore: prefer_const_constructors
                leading: Icon(Icons.wine_bar_rounded),
              ),
              const Divider(),
              ListTile(
                onTap: () => exit(0),
                leading: const Icon(
                  Icons.exit_to_app_rounded,
                  size: 20,
                ),
                title: const Text(
                  "Exit App",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // onTap:,
              ),
              const Divider(),
              ListTile(
                onTap: () => signOutUser(),

                title: const Text("Sign out"),
                // ignore: prefer_const_constructors
                leading: Icon(
                  Icons.logout_rounded,
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomAction() {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          // ignore: unnecessary_const
          child: const Text(
            "Your choice",
            // ignore: unnecessary_const
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 350,
            width: 400,
            child: ListView(
              children: List.generate(
                addCart.length,
                (index) => Carts(
                  title: addCart[index]['name'],
                  url: addCart[index]['url'],
                  itemPrice: addCart[index]['price'],
                  id: index,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(''),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Chip(
                label: Text('${addCart.length} selected'),
                avatar: const Icon(Icons.verified),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Code(),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: const Text('Continue'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    addCart.clear();
                  });
                },
                child: const Text('Cancel'),
              )
            ],
          ),
        )
      ],
    );
  }
}
