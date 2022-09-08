// ignore_for_file: avoid_unnecessary_containers, unused_local_variable, sort_child_properties_last, prefer_initializing_formals, non_constant_identifier_names

import 'package:application_project/registration_pages/regnav.dart';
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              Padding(padding: EdgeInsets.all(20)),
              CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/login_image.png')),
              SizedBox(
                height: 50,
              ),
              Text(
                'REGISTER YOURSELF',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              RegNav(),
            ],
          ),
        ),
      ],
    );
  }
}
