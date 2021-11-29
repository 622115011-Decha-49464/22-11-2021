// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_brace_in_string_interps

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
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController result = TextEditingController();

  @override
  void initState() {
    super.initState();
    result.text =
        "Buy x Bhug Apple. Because each Bhug Apple cost x THB, you have to pay x THB";
  }

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
                    "assets/apple.png",
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
                      controller: quantity,
                      decoration: InputDecoration(
                          labelText: "Bhug Apple Amount",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: price,
                      decoration: InputDecoration(
                          labelText: "Bhug Apple Price",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: ElevatedButton(
                      onPressed: () {
                        if (quantity.text.isEmpty && price.text.isEmpty) {
                          print("Input can't be null!!!!");
                          setState(() {
                            result.text = "Input can't be null!!!!";
                          });
                        } else {
                          var cal = double.parse(quantity.text) *
                              double.parse(price.text);
                          print(
                              "Bhug Apple quantity: ${quantity.text}, Bhug Apple price: ${price.text}, Total price: ${cal} THB");
                          setState(() {
                            result.text =
                                "Buy ${quantity.text} Bhug Apple. Because each Bhug Apple cost ${price.text} THB, you have to pay ${cal} THB";
                          });
                        }
                      },
                      child: Text("Calculate"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(50, 20, 50, 20))),
                    ),
                  ),
                  Text(
                    result.text,
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  )
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
