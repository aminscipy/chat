import 'package:chat/components/button.dart';
import 'package:chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  var email = '';
  var password = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      kInputDecoration.copyWith(hintText: 'Enter your email')),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kInputDecoration.copyWith(
                      hintText: 'Enter your password')),
              const SizedBox(
                height: 24.0,
              ),
              MyButton(
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  try {
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/chat');
                    setState(() {
                      loading = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                buttonName: 'Log In',
              )
            ],
          ),
        ),
      ),
    );
  }
}
