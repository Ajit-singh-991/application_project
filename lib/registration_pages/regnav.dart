// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class RegNav extends StatelessWidget {
  const RegNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30.0,
        backgroundColor: Colors.amber,
        title: const Center(
          child: Text(
            'Project 24',
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.amber,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
