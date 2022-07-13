import 'package:auth/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../api/google_sign_in.dart';

class HomePage extends StatefulWidget {
  final GoogleSignInAccount user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String name = widget.user.displayName!;
    String email = widget.user.email;
    String photoUrl =
        widget.user.photoUrl == null ? "default" : widget.user.photoUrl!;
    String id = widget.user.id;
    String serverAuthCode = widget.user.serverAuthCode == null
        ? "default"
        : widget.user.serverAuthCode!;

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "name: $name\nemail: $email\nphotoUrl: $photoUrl\nid: $id\nserverAuthCode: $serverAuthCode",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
              onPressed: signOut,
              icon: const FaIcon(FontAwesomeIcons.google),
              label: const Text('Logout')),
        ],
      ),
    ));
  }

  Future signOut() async {
    await GoogleSignInApi.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
