import 'package:elixir/pages/accountdetails.dart';
import 'package:elixir/pages/details.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatelessWidget {
  MyHomeScreen({super.key});

  final List<String> iconimages = [
    'assets/in.png',
    'assets/us.png',
    'assets/ca.png',
    'assets/cn.png',
    'assets/sg.png',
    'assets/dk.png',
    'assets/jp.png',
    'assets/lk.png',
    'assets/it.png',
    'assets/gr.png',
    'assets/pk.png',
    'assets/tr.png',
    'assets/th.png',
    'assets/au.png',
    'assets/nl.png',
    'assets/jm.png',
    'assets/ru.png',
    'assets/pt.png',
    'assets/nz.png',
    'assets/ir.png',
  ];

  final List<String> countries = [
    'India',
    'USA',
    'Canada',
    'China',
    'Singapore',
    'Denmark',
    'Japan',
    'Srilanka',
    'Italy',
    'Greece',
    'Pakistan',
    'Turkey',
    'Thailand',
    'Australia',
    'Netherlands',
    'Jamaica',
    'Russia',
    'Portugal',
    'NewZealand',
    'Iran',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'List Of Countries',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAccountScreen(),
                  ),
                );
              },
              icon: Icon(Icons.account_box_rounded),
              iconSize: 32,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                tileColor: Color.fromARGB(255, 247, 202, 221),
                leading: Image.asset(
                  iconimages[index],
                  width: 40,
                  height: 25,
                  fit: BoxFit.cover,
                ),
                title: Text(countries[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailsScreen(
                          countries[index],
                          iconimages[index],
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
