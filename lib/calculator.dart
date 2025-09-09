import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
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
    '&',
  ];

  Color buttonColorCheck(String val){
    if (val == 'C'){
      return Colors.green;
    }
    else if(val == 'DEL'){
      return Colors.red;
    }
    else if(val == '%' || val == '+' || val == '-' || val =='&' || val == '/' || val == '*'){
      return Colors.blue;
    }
    else{
      return Colors.white;
    }
  }

  Color textColorCheck(String val){
    final blackText = ['1','2','3','4','5','6','7','8','9','0','.','ANS'];

    if (blackText.contains(val)){
      return Colors.black;
    }
    else{
      return Colors.white;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    '1',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '7',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 50,),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: values.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color:  buttonColorCheck(values[index]),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    height: 30,
                    width: 30,
                    child: Center(
                      child: Text(values[index], style: TextStyle(
                        color: textColorCheck(values[index]),
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      ),),
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
