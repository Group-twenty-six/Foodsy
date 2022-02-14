import 'package:flutter/material.dart';

routesPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
      fullscreenDialog: true,
    ),
  );
}
