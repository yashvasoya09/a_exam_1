import 'package:a_exam_1/screen/provider/EProvider.dart';
import 'package:a_exam_1/screen/view/home_screen.dart';
import 'package:a_exam_1/screen/view/view%20screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(context) => homeScreen(),
          "viewScreen":(context) => viewScreen(),
        },
      ),
    ),
  );
}
