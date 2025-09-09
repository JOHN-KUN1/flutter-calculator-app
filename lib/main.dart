
import 'package:calculator_app/calculator.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 190, 217, 245),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 102, 132, 161),
        title: const Text('Calculator App',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ), ),
      ),
      body: const Calculator(),
    ),
  ));
}