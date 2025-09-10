import 'package:flutter/material.dart';

import 'package:string_equation/string_equation.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  String userInput = '';
  String calculatedAnswer = '';
  String storedAns = '';
  String answer = '';

  final List<String> values = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  Color buttonColorCheck(String val) {
    if (val == 'C') {
      return Colors.green;
    } else if (val == 'DEL') {
      return Colors.red;
    } else if (val == '%' ||
        val == '+' ||
        val == '-' ||
        val == '=' ||
        val == '/' ||
        val == '*') {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }

  Color textColorCheck(String val) {
    final blackText = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '0',
      '.',
      'ANS',
    ];

    if (blackText.contains(val)) {
      return Colors.lightBlue;
    } else {
      return Colors.white;
    }
  }

  void onKeyPressed(String val) {
    if (val == 'DEL'){
      setState(() {
        userInput = userInput.substring(0, userInput.length - 1);
      });
    }else if(val == '='){
      if(userInput.isEmpty){
        answer = 'Input is empty';
      }else if (!userInput.contains(RegExp(r'[0-9]'))){
        answer = 'Invalid Syntax';
      }
      else{
        try {
          answer = ConditionEquation().evaluateExpression(userInput).toString();
        } catch (e) {
          answer = 'Invalid Syntax';
        }
      }
      setState(() {
        calculatedAnswer = answer;
        storedAns = calculatedAnswer;
      });
    }else if(val == 'C'){
      setState(() {
        userInput = '';
        calculatedAnswer = '';
      });
    }else if(val == 'ANS'){
      setState(() {
        userInput = storedAns;
      });
    }
    else{
      setState(() {
        userInput += val;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4,right: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  userInput,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding:  const EdgeInsets.only(left: 4,right: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  calculatedAnswer,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: values.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onKeyPressed(values[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: buttonColorCheck(values[index]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 30,
                    width: 30,
                    child: Center(
                      child: Text(
                        values[index],
                        style: TextStyle(
                          color: textColorCheck(values[index]),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
