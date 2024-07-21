import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/home_page.dart';
import 'package:untitled/Screens/login_screen.dart';
import 'package:untitled/Screens/product_details_screen.dart';
import 'package:untitled/Screens/register_screen.dart';
import 'Screens/update_order_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EcommIntra());
}

class EcommIntra extends StatelessWidget {
  const EcommIntra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomePage.id: (context) => HomePage(),
        UpdateOrderScreen.id: (context) => UpdateOrderScreen(),
        //ProductDetailsScreen.id: (context) => ProductDetailsScreen(),
      },
      initialRoute: LoginScreen.id,
    );
  }
}
