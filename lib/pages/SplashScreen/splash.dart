// ignore_for_file: sort_child_properties_last

import 'dart:async';
import 'package:application_project/registration_pages/registration.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool _visible = true;
  final Tween<double> _scaleTween = Tween<double>(begin: 2, end: 1);

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      (() => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const RegistrationPage()),
          (route) => false)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TweenAnimationBuilder(
            tween: _scaleTween,
            duration: const Duration(seconds: 3),
            builder: (BuildContext context, scale, Widget? child) {
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: Center(
              child: AnimatedContainer(
                color: Colors.purple,
                alignment: Alignment.center,
                curve: Curves.easeOutExpo,
                duration: const Duration(seconds: 3),
                child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/login_image.png',
                            filterQuality: FilterQuality.high,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'HAPPY CODING IN FLUTTER',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      )
                    ]),
                onEnd: () {
                  setState(() {
                    _visible = !_visible;
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationPage()),
                        (route) => false);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
