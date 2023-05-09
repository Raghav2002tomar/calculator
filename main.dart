// import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Caluclator"),
          centerTitle: true,
        ),
        body: Container(
          
          child: Center(
            
              child: Container(
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Fill Information",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: wtcontroller,
                    decoration: const InputDecoration(
                        labelText: "Enter your weight in (kg)",
                        labelStyle: TextStyle(fontSize: 20),
                        prefixIcon: Icon(Icons.line_weight_rounded)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: ftcontroller,
                    decoration: const InputDecoration(
                        labelText: "Enter your Height in (Fit)",
                        labelStyle: TextStyle(fontSize: 20),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: incontroller,
                    decoration: const InputDecoration(
                        labelText: "Enter your Height in (inch)",
                        labelStyle: TextStyle(fontSize: 20),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 13),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtcontroller.text.toString();
                        var ft = ftcontroller.text.toString();
                        var inch = incontroller.text.toString();
            
                        if (wt != "" && ft != "" && inch != "") {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iinch = int.parse(inch);
            
                          var tinch = (ift * 12) + iinch;
                          var tcm = tinch * 2.54;
                          var tm = tcm / 100;
                          var bmi = iwt / (tm * tm);
                          var msg = "";
                          if (bmi > 25) {
                            msg = "You are Overweight";
                          } else if (bmi < 18) {
                            msg = "You are Underweight";
                          } else {
                            msg = "You are Healthy";
                          }
                          setState(() {
                            result =
                                " $msg  \n \n Your BMI is ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "please fill all the required blanks";
                          });
                        }
                      },
                      child: Text(
                        "Calculate",
                      )),
                      SizedBox(height: 10,),
                  Text(
                    result,
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
