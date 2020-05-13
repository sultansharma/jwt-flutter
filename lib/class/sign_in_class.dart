import 'dart:ui';

import 'package:drf_flutter/provider/user_provider.dart';
import 'package:drf_flutter/theme/hex_color.dart';
import 'package:drf_flutter/views/dashboard/dashboard.dart';
import 'package:drf_flutter/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Sign_in_class extends StatefulWidget {
  String msg;
  Sign_in_class({this.msg});
  @override
  _Sign_in_classState createState() => _Sign_in_classState();
}

class _Sign_in_classState extends State<Sign_in_class> {
    
  TextEditingController loginUsernameController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();
   
   //Snackbar to show Error
   final snackBar = SnackBar(
            backgroundColor: Colors.redAccent,
            content: 
                 Text('Please provide valid details !' , 
                textAlign: TextAlign.center,)
          );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        sign_in_form()
      ],
    );
  }
    Widget sign_in_form(){
    return     SliverToBoxAdapter(
                child:  Hero(
                  tag: "main",
                  createRectTween: _createRectTween,
                                  child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.black,
                   color: HexColor("7788d8"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                         
                             Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top:200),
                                  child: Text("Hello There !" , style: TextStyle(
                                    color: HexColor("ffffff"),
                                    fontSize: 35, fontWeight: FontWeight.w500
                                  )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text("Sign in to continue caring", style: TextStyle(
                                    color: HexColor("ffffff"),
                                    fontSize: 20, fontWeight: FontWeight.w400),)
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(30),
                                      child: Column(
                                      children: <Widget>[
                                      widget.msg == "done" ? Container(
                                          color: Colors.white,
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.all(10),
                                          child: Text("Sign up done - login now !", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green)),
                                        ) : Container(child: Text("")),

                                        Container(
                                 // color: Color(0xfff5f5f5),
                                  child: TextFormField(
                                    controller: loginUsernameController,
                                    style: TextStyle(color: Colors.white , fontSize: 18),
                                  
                                    decoration: InputDecoration(
                                     
                                      focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(color: Colors.transparent)
                                     ),
                                     enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(color: Colors.transparent)
                                     ),
                                     hintText: "Username",
                                     hintStyle: TextStyle(
                                      fontStyle: FontStyle.normal,
                                        fontSize: 20 , color: Colors.white24 , fontWeight: FontWeight.w600
                                      ),
                                      prefixIcon: Icon(Icons.account_circle , size: 22, color: Colors.white,),
                                    
                                    ),
                                  
                                  ),
                                ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                                          child: Divider(
                                            height: 2,
                                            thickness: 1.5,
                                            color: Colors.white24
                                          ),
                                          
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                         Container(
                                       //    height: 50,
                                 // color: Color(0xfff5f5f5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Flexible(
                                      child: TextFormField(
                                    controller: loginPasswordController,
                                    obscureText: true,
                                    style: TextStyle(color: Colors.white , fontSize: 20),
                                    decoration: InputDecoration(
                               
                                          focusedBorder: OutlineInputBorder(
                                           borderSide: BorderSide(color: Colors.transparent)
                                     ),
                                     enabledBorder: OutlineInputBorder(
                                           borderSide: BorderSide(color: Colors.transparent)
                                     ),
                                     hintText: "Password",
                                     hintStyle: TextStyle(
                                          fontStyle: FontStyle.normal,
                                            fontSize: 20 , color: Colors.white24 , fontWeight: FontWeight.w600
                                          ),
                                          prefixIcon: Icon(Icons.lock , size: 22, color: Colors.white,),
                                    
                                    ),
                                  
                                  ),
                                      ),
                                      
                                       Padding(
                                         padding: const EdgeInsets.all(12.0),
                                         child: Text("FORGOT" , style: TextStyle(color: Colors.white,
                                         fontWeight: FontWeight.w700, 
                                         ),),
                                       )
                                    ],
                                  ) ),
                                    Padding(
                                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                                          child: Divider(
                                            height: 2,
                                            thickness: 1.5,
                                            color: Colors.white24
                                          ),
                                          
                                        ),
                                       Consumer<UserProvider>(builder: (_, login, __) => 
                                         Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: RaisedButton(onPressed: () async {
                                           dynamic result = await Provider.of<UserProvider>(context).sign_in(loginUsernameController.text, loginPasswordController.text);
                                           if(result != 200) {
                                           Scaffold.of(context).showSnackBar(snackBar);
                                           } else {
                                          Navigator.push<dynamic>(context,
                                          MaterialPageRoute<dynamic>(builder: (context) => DashBoard()));
                           
                               
                                           }
                                          },
                                          color: Colors.white,
                                          padding: EdgeInsets.only(top: 20, bottom: 20),
                                          child: Container(
                                         
                                            width: MediaQuery.of(context).size.width,
                                            child: Text(login.login_button, textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.w700 , color: Colors.blueGrey)
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30)
                                          )
                                          ,
                                          ),
                                        )
                                     ) 
                                      
                                      ],
                                      ),
                                    ),
                                   
                                    ],
                            ),
                         
                          Container(
                             margin: EdgeInsets.only(bottom: 20),
                             //  color: Colors.green,
                               child:   InkWell(
                              onTap: (){
                                 Navigator.push<dynamic>(context,
                                MaterialPageRoute<dynamic>(builder: (context) => SignUp()));
                         
                              },
                              child: Text("CREATE  ACCOUNT" , textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.w700 , color: Colors.white)
                                   ),
                               ),
                             
                             )
                        ],
                      )
  
              ),
                ),
         
              );
           
  }
  static RectTween _createRectTween(Rect begin, Rect end) {
    return CircularRectTween(begin: begin, end: end);
  }

}

class CircularRectTween extends RectTween {
  CircularRectTween({Rect begin, Rect end}) : super(begin: begin, end: end) {}
  @override
  Rect lerp(double t){
    final double width = lerpDouble(begin.width, end.width, t);
    double startWidthCenter = begin.left +(begin.width/2);
    double startHeightCenter = begin.left +(begin.height/2);

    return Rect.fromCircle(center: Offset(startWidthCenter, startHeightCenter), radius: width * 2.5);
  }
}