import 'package:flutter/material.dart';
import 'package:chat/components/button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 1), vsync: this, upperBound: 60);
    controller?.forward();
    controller?.addListener(() {
      setState(() {});
      controller?.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: controller?.value,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                const Text(
                  'Flash Chat',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.purple),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            MyButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                buttonName: 'Login'),
            MyButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                buttonName: 'Register')
          ],
        ),
      ),
    );
  }
}
