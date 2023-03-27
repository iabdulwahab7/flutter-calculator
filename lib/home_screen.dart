import 'package:flutter/material.dart';
import 'components/calculator_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(result.toString(), style: TextStyle(fontSize: 30, color: Colors.white),)),
                      const SizedBox(height: 15),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(userInput.toString(),style: TextStyle(fontSize: 30, color: Colors.white),)),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CalculatorButton(
                          title: 'AC',
                          btnColor: Colors.deepOrange,
                          onPress: () {
                            userInput = '';
                            result = '';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '+/-',
                          btnColor: Colors.deepOrange,
                          onPress: () {
                            userInput += '';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '%',
                          btnColor: Colors.deepOrange,
                          onPress: () {
                            userInput += '%';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '/',
                          btnColor: Colors.deepOrange,
                          onPress: () {
                            userInput += '/';
                            setState(() {

                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                          title: '7',
                          onPress: () {
                            userInput += '7';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '9',
                          onPress: () {
                            userInput += '9';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: 'x',
                          btnColor: Colors.deepOrange,
                          onPress: () {
                            userInput += 'x';
                            setState(() {

                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                          title: '4',
                          onPress: () {
                            userInput += '4';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '-',
                          btnColor: Colors.deepOrange,
                          onPress: () {
                            userInput += '-';
                            setState(() {

                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                          title: '1',
                          onPress: () {
                            userInput += '1';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '+',
                          btnColor: Colors.deepOrange,
                          onPress: () {
                            userInput += '+';
                            setState(() {

                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: 'DEL',
                          btnColor: Colors.red,
                          onPress: () {
                            userInput = userInput.substring(0, userInput.length -1);
                            setState(() {

                            });
                          },
                        ),
                        CalculatorButton(
                          title: '=',
                          btnColor: Colors.green,
                          onPress: () {
                            equalPress();
                            setState(() {

                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress (){

    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    result = eval.toString();
  }
}
