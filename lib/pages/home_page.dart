import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  String mainColor = "#0b0d24";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(mainColor),
      appBar: AppBar(
        backgroundColor: HexColor("#14173b"),
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
        ),
        title: const Text(
          'Escaneo',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        
        ],
      ),
      body: Column(
        children: <Widget>[
          
        ],
      ),
    );
  }
}
