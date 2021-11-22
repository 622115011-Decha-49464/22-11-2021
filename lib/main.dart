// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Calculate App",
            style:
                TextStyle(fontFamily: "Maa", fontSize: 50, color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
        body: Home(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "apple.png",
                    width: 200,
                  ),
                  GradientText(
                    "Bhug Apple calculator!!!",
                    style: TextStyle(
                        fontFamily: "Maa",
                        fontSize: 100,
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed),
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.red,
                      Colors.teal,
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Apple Amount",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Calculated"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    ),
                  ),
                  Text(
                      "Buy 5 Bhug Apple. Because each Bhug Apple cost 1,000 THB, you have to pay 5,000 THB")
                ],
              ),
            ))
      ],
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
