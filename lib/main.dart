import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String inputValue = "";
  String calculatedValue = "";
  String operator = "";
  String displayValue = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 4.5;

    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  displayValue,
                  style: TextStyle(color: Colors.white, fontSize: 70),
                ),
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: calcButton(
                        "AC",
                        const Color.fromARGB(255, 165, 165, 165),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  calcButton("7", const Color.fromARGB(255, 55, 55, 55)),
                  calcButton("8", const Color.fromARGB(255, 55, 55, 55)),
                  calcButton("9", const Color.fromARGB(255, 55, 55, 55)),
                  calcButton("÷", const Color.fromARGB(255, 255, 149, 0)),
                ],
              ),
              Row(
                children: [
                  calcButton("4", const Color.fromARGB(255, 55, 55, 55)),
                  calcButton("5", const Color.fromARGB(255, 55, 55, 55)),
                  calcButton("6", const Color.fromARGB(255, 55, 55, 55)),
                  calcButton("×", const Color.fromARGB(255, 255, 149, 0)),
                ],
              ),
              Row(
                children: [
                  calcButton("1", const Color.fromARGB(255, 55, 55, 55)),
                  calcButton("2", const Color.fromARGB(255, 55, 55, 55)),
                  calcButton("3", const Color.fromARGB(255, 55, 55, 55)),
                  calcButton("-", const Color.fromARGB(255, 255, 149, 0)),
                ],
              ),
              Row(
                children: [
                  calcButton(".", const Color.fromARGB(255, 55, 55, 55)),
                  calcButton("0", const Color.fromARGB(255, 55, 55, 55)),
                  calcButton("=", const Color.fromARGB(255, 255, 149, 0)),
                  calcButton("+", const Color.fromARGB(255, 255, 149, 0)),
                ],
              ),

              Container(margin: EdgeInsets.only(bottom: 20)),
            ],
          ),
        ),
      );
  }

  Widget calcButton(String number, Color calcColor, ) {
    return InkWell(
      onTap: () {
        if (number == "AC") {
          setState(() {
            inputValue = "";
            calculatedValue = "";
            displayValue = "";
          });
        } else if (number == "+" ||
            number == "-" ||
            number == "×" ||
            number == "÷") {
          setState(() {
            calculatedValue = inputValue;
            inputValue = "";
            operator = number;
            displayValue = number;
          });
        } else if (number == "=") {
          setState(() {
            while (true) {
              if (calculatedValue != "") {
                double calculatedValue1 = double.parse(calculatedValue);
                double inputValue1 = double.parse(inputValue);

                if (operator == "+") {
                  inputValue = (calculatedValue1 + inputValue1).toString();
                } else if (operator == "-") {
                  inputValue = (calculatedValue1 - inputValue1).toString();
                } else if (operator == "×") {
                  inputValue = (calculatedValue1 * inputValue1).toString();
                } else if (operator == "÷") {
                  inputValue = (calculatedValue1 / inputValue1).toString();
                }
                displayValue = inputValue;
                break;
              } else {
                break;
              }
            }
          });
        } else {
          setState(() {
            inputValue += number;
            displayValue = inputValue;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: calcColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(blurRadius: 10, spreadRadius: 5, color: Colors.black54),
          ],
        ),
        margin: EdgeInsets.only(bottom: 7, left: 10),
        alignment: Alignment.center,
        height: size,
        width: size,
        child: Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

