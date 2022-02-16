import 'package:flutter/material.dart';

class Carts extends StatefulWidget {
  final String title;
  final String url;
  final double itemPrice;
  final int id;
  const Carts(
      {Key? key,
      required this.title,
      required this.url,
      required this.itemPrice,
      required this.id})
      : super(key: key);

  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(widget.url),
        ),
        title: Text(widget.title),
        subtitle: Text(widget.itemPrice.toString()),
        trailing: Chip(
          avatar: IconButton(
            onPressed: () {
             
              setState(() {
                // addCart.removeAt(widget.id);
              });
            },
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.remove_circle_outline_rounded,
            ),
          ),
          label: Text(''),
        ),
      ),
    );
  }
}
