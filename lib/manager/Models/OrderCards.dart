import 'package:flutter/material.dart';

class OrderCards extends StatefulWidget {
  final String orderName;
  final double orderPrice;
  final String orderUrl;
  final String user;
  const OrderCards({
    Key? key,
    required this.orderName,
    required this.orderPrice,
    required this.user,
    required this.orderUrl,
  }) : super(key: key);

  @override
  State<OrderCards> createState() => _OrderCardsState();
}

class _OrderCardsState extends State<OrderCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(widget.orderName),
            subtitle: Text("Ordered by ${widget.user}"),
            trailing: Text("${widget.orderPrice}"),
            leading: Image.asset(widget.orderUrl),
          ),
        ),
      ),
    );
  }
}
