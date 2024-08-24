import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 5, 144, 10)),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 0.0;
  double _weight = 0.0;
  int _bmi = 0;
  String _condition = "choose data";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.40,
              width: double.infinity,
              decoration: BoxDecoration(color: Color.fromARGB(255, 5, 144, 10)),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 60),
                  ),
                  Text(
                    "calculator",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        "$_bmi",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "condition :",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        children: [
                          TextSpan(
                              text: "$_condition",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text("Choose Data",
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 144, 10),
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      )),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Height :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 126, 122, 122),
                          fontSize: 20),
                      children: [
                        TextSpan(
                          text: "$_height",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: _height,
                    min: 0,
                    max: 250,
                    onChanged: (height) {
                      setState(
                        () {
                          _height = height;
                        },
                      );
                    },
                    divisions: 250,
                    label: "$_height",
                    activeColor: Color.fromARGB(255, 58, 56, 56),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Weight :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 126, 122, 122),
                          fontSize: 20),
                      children: [
                        TextSpan(
                          text: "$_weight",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: _weight,
                    min: 0,
                    max: 300,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    },
                    divisions: 300,
                    label: "$_weight",
                    activeColor: Color.fromARGB(255, 58, 56, 56),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 5, 144, 10),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {
                          setState(() {
                            _bmi =
                                (_weight / ((_height / 100) * (_height / 100)))
                                    .round()
                                    .toInt();
                            if (_bmi >= 18.5 && _bmi <= 24.9) {
                              _condition = "Normal";
                            } else if (_bmi >= 25 && _bmi <= 29.9) {
                              _condition = "Overweight";
                            } else if (_bmi > 30 && _bmi < 39.9) {
                              _condition = "Obesity";
                            } else if (_bmi > 40) {
                              _condition = "severely obese";
                            } else {
                              _condition = "Underweight";
                            }
                          });
                        },
                        child: Text(
                          "Calculated",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
