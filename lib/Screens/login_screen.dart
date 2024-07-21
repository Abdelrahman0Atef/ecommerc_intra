import 'package:flutter/material.dart';
import 'package:untitled/Screens/home_page.dart';
import 'package:untitled/Screens/register_screen.dart';
import 'package:untitled/Widgest/custom_textfiled.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String id = 'LoginScreen';

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
                hintText: 'Email',
                obscureText: false,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'HomePage');
                },
                child: Text(
                  'Log In',
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
                  Text('Don\'t have account '),
                  InkWell(
                    child: Text('Register',style: TextStyle(color: Colors.lightBlueAccent),),
                    onTap: () {
                      Navigator.pushNamed(
                        context, 'RegisterScreen'
                      );
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
