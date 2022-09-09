import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          'About Company',
          style: TextStyle(
            color: Color.fromARGB(123, 151, 49, 179),
            fontSize: 90.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
