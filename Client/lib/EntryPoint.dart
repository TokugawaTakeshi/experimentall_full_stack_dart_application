import "package:flutter/material.dart";

import "package:my_first_flutter_application/Pages/MainPage.dart";


void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.teal,
    accentColor: Colors.redAccent
  ),
  initialRoute: "/",
  routes: {
    "/": (context) => MainPage(),
  }
));
