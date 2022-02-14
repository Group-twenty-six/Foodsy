import 'package:flutter/material.dart';
import 'package:market/Global/Global.dart';

class CashFlow extends StatefulWidget {
  const CashFlow({Key? key}) : super(key: key);

  @override
  State<CashFlow> createState() => _CashFlowState();
}

class _CashFlowState extends State<CashFlow> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var i = 0; i < addCart.length; i++) {
      total += addCart[i]['price'];
    }
    // ignore: avoid_unnecessary_containers
    return Container(
      child: addCart.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 90,
                ),
                child: Text("No Cash flow made"),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Orders",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Price",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Expanded(
                      child: ListView(
                        children: List.generate(
                          addCart.length,
                          (index) => ListTile(
                            title: Text(
                              addCart[index]['name'],
                            ),
                            subtitle: Text(addCart[index]['date']),
                            trailing: Text("${addCart[index]['price']}"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Chip(label: Text("Total items ${addCart.length}")),
                      Chip(label: Text("Total price $total")),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
