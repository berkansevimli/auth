import 'package:auth/api/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LoginScreen',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
              onPressed: signIn,
              icon: const FaIcon(FontAwesomeIcons.google),
              label: const Text('Login with Google')),
        ],
      ),
    ));
  }

  Future<void> signIn() async {
    GoogleSignInApi.signIn();
  }
}
