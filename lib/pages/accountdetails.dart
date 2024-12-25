import 'package:elixir/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:elixir/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({super.key});

  dynamic user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleSignOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyLogin(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name:  ' + user.displayName!,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email:  ' + user.email!,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Status:  Logged In',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
