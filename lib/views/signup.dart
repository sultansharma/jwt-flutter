import 'package:drf_flutter/class/sign_up_class.dart';
import 'package:drf_flutter/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dashboard/dashboard.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController signupUsernameController = new TextEditingController();
  TextEditingController signupPassword1Controller = new TextEditingController();
  TextEditingController signupPassword2Controller = new TextEditingController();
  TextEditingController signupFirstNameController = new TextEditingController();
  TextEditingController signupEmailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Material(
      type: MaterialType.transparency,
          child: Scaffold(
            body:   Sign_up_class()
      ),
    );
 
  }
 }