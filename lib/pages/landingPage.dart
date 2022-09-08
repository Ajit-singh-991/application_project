// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        elevation: 30.0,
        bottomOpacity: 0.0,
        toolbarOpacity: 0.0,
        scrolledUnderElevation: 30.0,
        backgroundColor: Color.fromARGB(255, 225, 161, 236),
        title: const Center(
          child: Text(
            'Dashboard',
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 60.0),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(
            style: BorderStyle.solid,
            width: 1.0,
            strokeAlign: StrokeAlign.center,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 225, 161, 236),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Image(
              image: AssetImage('assets/images/login_image.png'),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Welcome',
              style: TextStyle(
                color: Color.fromARGB(255, 161, 6, 204),
                fontSize: 45.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'To',
              style: TextStyle(
                color: Color.fromARGB(255, 198, 75, 232),
                fontSize: 35.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Dashboard',
              style: TextStyle(
                color: Color.fromARGB(123, 151, 49, 179),
                fontSize: 90.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
