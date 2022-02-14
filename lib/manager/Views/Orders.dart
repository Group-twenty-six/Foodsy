// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:market/Global/Global.dart';
import 'package:market/manager/Models/OrderCards.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_is_empty
    return (addCart.length < 1)
        ? Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 88.0),
              child: Column(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Icon(
                        Icons.timer_off_outlined,
                        size: 54,
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text(
                        "You Currently have no orders made....",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : ListView(
            children: List.generate(
                addCart.length,
                (index) => OrderCards(
                    user: addCart[index]['user'],
                    orderName: addCart[index]['name'],
                    orderPrice: addCart[index]['price'],
                    orderUrl: addCart[index]['url'])));
  }
}
