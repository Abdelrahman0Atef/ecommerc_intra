import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/login_screen.dart';

import '../Widgest/custom_textfiled.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static String id = 'RegisterScreen';
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ecom.png',
                height: 250,
                width: 250,
              ),
              CustomTextField(
                onChanged: (data) {
                  email = data;
                },
                hintText: 'Email',
                obscureText: false,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'User Name',
                obscureText: false,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    var auth = FirebaseAuth.instance;
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Weak Password'),
                        ),
                      );
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Email is already exist'),
                        ),
                      );
                    }
                  }
                  Navigator.pushNamed(context, 'HomePage');
                  SnackBar(
                    content: Text('Email Created'),
                  );
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 50),
                    fixedSize: Size(400, 50),
                    backgroundColor: Colors.lightBlueAccent),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I have account '),
                  InkWell(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'LoginScreen');
                    },
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
