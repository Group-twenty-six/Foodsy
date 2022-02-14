import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market/Welcome.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// This is the screen that you'll see when the app starts
class MainScreen extends StatefulWidget {
  final String msg;
  const MainScreen({Key? key, required this.msg}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    const message =
        // ignore: lines_longer_than_80_chars
        'Foodsy App';

    final qrFutureBuilder = FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (ctx, snapshot) {
        const size = 280.0;
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return SizedBox(
          child: FittedBox(
            child: CustomPaint(
              size: const Size.square(size),
              painter: QrPainter(
                data: widget.msg,
                version: QrVersions.auto,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Color(0xff128760),
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: Color(0xff1a5441),
                ),
                // size: 320.0,
                embeddedImage: snapshot.data,
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: const Size.square(60),
                ),
              ),
            ),
          ),
        );
      },
    );

    return Scaffold(
      body: Material(
        color: Colors.white,
        child: SafeArea(
          top: true,
          bottom: true,
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 280,
                      child: qrFutureBuilder,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20)
                          .copyWith(bottom: 100),
                  child: const Text(
                    message,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const Welcome();
            }),
          );
        },
        label: const Text("Back to menu"),
      ),
    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('images/foodsy.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }
}
