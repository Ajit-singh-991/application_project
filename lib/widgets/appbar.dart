import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget {
  const AppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      elevation: 30.0,
      iconTheme: const IconThemeData(
        color: Colors.purple,
        size: 40,
      ),
      scrolledUnderElevation: 50.0,
      backgroundColor: Colors.purple,
      title: const Center(
        child: Text(
          'Dashboard',
          style: TextStyle(
              color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30.0),
        ),
      ),
    );
  }
}
