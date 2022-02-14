import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String person;
  final Widget nextPage;
  const Loader({Key? key, required this.person, required this.nextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 14), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => nextPage,
          fullscreenDialog: true,
        ),
      );
    });
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 88.0),
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
            Center(
              child: Text("Loading $person...."),
            ),
          ],
        ),
      ),
    );
  }
}
