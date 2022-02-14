import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market/Global/Global.dart';
import 'package:market/QrCode/Qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';

class Code extends StatefulWidget {
  const Code({
    Key? key,
  }) : super(key: key);

  @override
  State<Code> createState() => _CodeState();
}

class _CodeState extends State<Code> {
  Widget qrCodeWidget = Container();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Process your order"),
      ),
      body: SafeArea(
          child: Center(
        child: PhysicalModel(
          shadowColor: Colors.black45,
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
          child: AvatarGlow(
            endRadius: 100,
            child: CircleAvatar(
              radius: 80,
              child: IconButton(
                iconSize: 80,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) =>
                          MainScreen(msg: json.encode(addCart)),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.qr_code_2_rounded,
                ),
                // : const Text("Generate QrCode"),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
