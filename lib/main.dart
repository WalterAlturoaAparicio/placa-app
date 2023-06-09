
import 'package:flutter/material.dart';
import 'package:placa_app/pages/home_page.dart';
import 'package:placa_app/pages/login_page.dart';
import 'package:placa_app/pages/register_page.dart';

void main() async {
  // await init();
  runApp(const MyApp());
}
// Future init() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
// }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': ((context) => LoginPage()),
        '/home': (context) => const HomePage(),
        '/login': ((context) => LoginPage()),
        '/register': ((context) => RegisterPage())
      },
    );
  }
}