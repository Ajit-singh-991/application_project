import 'package:application_project/registration_pages/regpage.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30.0,
        title: Container(
          height: 100,
          width: 800,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(195, 20, 50, 1.0),
                Color.fromRGBO(36, 11, 54, 1.0)
              ],
            ),
          ),
          child: const Center(
            child: Text(
              "Registration Page",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(64.0),
        child: Center(child: RegPage()),
      ),
    );
  }
}
