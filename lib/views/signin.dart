import 'package:drf_flutter/class/sign_in_class.dart';
import 'package:drf_flutter/provider/user_provider.dart';
import 'package:drf_flutter/theme/hex_color.dart';
import 'package:drf_flutter/views/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SignIn extends StatefulWidget {
  String msg;
  SignIn({this.msg});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
          child: Scaffold(
            body:  Sign_in_class(msg: widget.msg)
      ),
    );
  }
}
