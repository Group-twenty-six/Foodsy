import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market/Global/Global.dart';

class ItemCart extends StatefulWidget {
  final String itemName;
  final String imageUrl;
  final double price;
  final int id;
  const ItemCart(
      {Key? key,
      required this.imageUrl,
      required this.itemName,
      required this.price,
      required this.id})
      : super(key: key);

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.itemName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      )),
      footer: TextButton.icon(
        onPressed: () {
          var date = DateTime.now();
          var data = {
            'name': widget.itemName,
            'url': widget.imageUrl,
            'price': widget.price,
            'date': date.toString(),
            'user': FirebaseAuth.instance.currentUser!.email,
          };
          setState(() {
            addCart.add(data);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text("Add ${widget.itemName} to cart"),
            ),
          );
        },
        icon: const Icon(
          Icons.add_shopping_cart_rounded,
        ),
        label: Text("Shs ${widget.price}"),
      ),
      child: Card(
        child: Center(
          child: SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(widget.imageUrl),
          ),
        ),
      ),
    );
  }
}
