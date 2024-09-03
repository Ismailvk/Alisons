import 'package:allison/data/shared_preference/shared_pref.dart';
import 'package:allison/view/home.dart';
import 'package:allison/view/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logincheck(context);
    return const Scaffold(
      body: Center(
        child: Text('Splash '),
      ),
    );
  }

  logincheck(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    final token = SharedPref.instance.getToke();
    if (token != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}
