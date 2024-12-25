import 'package:elixir/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:elixir/provider/google_sign_in.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return MyHomeScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Something Went Wrong'),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login.png'), fit: BoxFit.cover),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 35,
                        top: MediaQuery.of(context).size.height * 0.22),
                    child: Text(
                      'Login\nScreen',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * .04),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.5,
                          right: 30,
                          left: 30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey.shade400,
                                  foregroundColor: Colors.white,
                                  minimumSize: Size(double.infinity, 50)),
                              icon: Icon(
                                FontAwesomeIcons.google,
                                color: Colors.red.shade400,
                              ),
                              label: Text(
                                'SignIn with Google',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              onPressed: () {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(
                                  context,
                                  listen: false,
                                );
                                provider.googleLogin();
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
