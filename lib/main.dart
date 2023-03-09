import 'package:flutter/material.dart';
import 'package:form_demo/Pages/cricketScore.dart';
import 'package:form_demo/Pages/data.dart';
import 'Pages/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Form',
      initialRoute: 'home',

      routes: {
        'home': (context) => HomePage(),
        'dataApi':(context) => dataApi(),
        'cricket':(context) => cricketApi(),
      },
    );
  }
}