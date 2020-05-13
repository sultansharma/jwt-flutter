import 'package:drf_flutter/provider/user_provider.dart';
import 'package:drf_flutter/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
 
  MultiProvider(
   providers: [
  ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
  ],
  child: 
  MaterialApp(
      theme:  ThemeData(primaryColor: Colors.red, fontFamily: 'Montserrat', accentColor: Colors.yellowAccent),
        debugShowCheckedModeBanner: false,
      home: Splash_screen(),
     ),
)
);