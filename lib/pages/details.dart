import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String countriesFromHome;
  final String iconimages;

  DetailsScreen(this.countriesFromHome, this.iconimages);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Country Details:',
            style: TextStyle(
              color: Colors.black26,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              iconimages,
              width: MediaQuery.of(context).size.width * 50,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Country Name: $countriesFromHome',
              style: TextStyle(color: Colors.black26, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
