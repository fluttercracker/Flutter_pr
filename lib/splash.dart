import 'package:flutter/material.dart';
import 'dart:async';

import 'package:note_application/main.dart'; // if MyHomePage is in another file

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    Timer(const Duration(seconds: 4), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const MyHomePage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo1.png', width: 150,),
              const SizedBox(height: 60),
              const CircularProgressIndicator(color: Colors.deepPurple),
              const SizedBox(height: 25),
              const Text(
                'Loading Notes...',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
