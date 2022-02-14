import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutterfire_ui/auth.dart';
import 'package:market/Global/Loader.dart';
import 'package:market/manager/Views/home.dart';

class ManagerAuth extends StatelessWidget {
  const ManagerAuth({Key? key}) : super(key: key);

  // final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              showAuthActionSwitch: true,
              headerBuilder: (context, constraints, _) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      'images/foodsy.png',
                    ),
                  ),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    action == AuthAction.signIn
                        ? 'Welcome to foodsy! Please sign in to continue.'
                        : 'Welcome to foodsy! Please create an account to continue',
                  ),
                );
              },
              //footer
              footerBuilder: (context, _) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'By signing in, you agree to our terms and conditions of foodsy.',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
              providerConfigs: const [
                EmailProviderConfiguration(),
                // GoogleProviderConfiguration(
                //   clientId: '...',
                // ),
              ],
            );
          }
          return const Home();
        },
      ),
    );
  }
}
