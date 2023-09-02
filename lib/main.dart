import 'package:flutter/material.dart';
import 'package:project_bmi/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => FirstScreen();
}

class FirstScreen extends State<MyHomePage> {
  var weight = TextEditingController();
  var heightinch = TextEditingController();
  var heightfoot = TextEditingController();
  var result = "";
  var bgcolor = const Color.fromARGB(255, 0, 255, 204);
  var msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 23,
                  fontWeight: FontWeight.w700),
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Body-Mass Index',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  TextField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('Weight(Kg)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: heightfoot,
                    decoration: InputDecoration(
                      label: Text('Height(Foot)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: heightinch,
                    decoration: InputDecoration(
                      label: Text('Height(Inch)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var w = weight.text.toString();
                      var hf = heightfoot.text.toString();
                      var hi = heightinch.text.toString();
                      if (hf != "" && hi != "" && w != "") {
                        var iw = int.parse(w);
                        var ihf = int.parse(hf);
                        var ihi = int.parse(hi);
                        var tinch = (ihf * 12) + ihi;
                        var hcm = tinch * 2.54;
                        var hm = hcm / 100;
                        setState(() {
                          var res = iw / (hm * hm);
                          result = "Your BMI is :" + res.toStringAsFixed(4);
                          if (res > 25) {
                            msg = "OverWeight!!";
                            bgcolor = Colors.red;
                          } else if (res < 18) {
                            msg = "LightWeight...";
                            bgcolor = Colors.yellow;
                          } else {
                            msg = "You are fit👍👍";
                            bgcolor = Colors.green;
                          }
                        });
                      } else {
                        setState(() {
                          result = "Required all fields";
                        });
                      }
                    },
                    child: Text('BMI'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${msg}\n${result}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
