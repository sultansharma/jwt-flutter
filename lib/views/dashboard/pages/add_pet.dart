import 'package:drf_flutter/class/add_pet_class.dart';
import 'package:drf_flutter/provider/user_provider.dart';
import 'package:drf_flutter/theme/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Add_Pet extends StatefulWidget {
  @override
  _Add_PetState createState() => _Add_PetState();
}

class _Add_PetState extends State<Add_Pet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Add_Pet_class()
          );
  }
}