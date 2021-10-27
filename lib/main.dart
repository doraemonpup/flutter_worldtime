import 'package:flutter/material.dart';

import './pages/choose_location.dart';
import './pages/loading.dart';
import 'package:flutterworldtime/pages/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ),
  );
}
