//import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:fl_chart/fl_chart.dart';
//import 'package:csv/csv.dart';
//import 'dart:io';
import 'pages/page_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   //useMaterial3: true,
      // ),
      home: const PageContainer(),
    );
  }
}
