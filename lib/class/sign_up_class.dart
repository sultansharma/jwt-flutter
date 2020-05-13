import 'package:drf_flutter/provider/user_provider.dart';
import 'package:drf_flutter/theme/hex_color.dart';
import 'package:drf_flutter/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Sign_up_class extends StatefulWidget {
  @override
  _Sign_up_classState createState() => _Sign_up_classState();
}

class _Sign_up_classState extends State<Sign_up_class> {
    
  TextEditingController usernameController = new TextEditingController();
  TextEditingController password1Controller = new TextEditingController();
  TextEditingController password2Controller = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
    String error = "";
   //Snackbar to show Error
 

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
                child:  Container(
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
                                padding: EdgeInsets.only(top:70),
                                child: Text("Sign Up !" , style: TextStyle(
                                  color: HexColor("ffffff"),
                                  fontSize: 35, fontWeight: FontWeight.w500
                                )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text("Register to access service", style: TextStyle(
                                  color: HexColor("ffffff"),
                                  fontSize: 20, fontWeight: FontWeight.w400),)
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(30),
                                    child: Column(
                                    children: <Widget>[
                                      Container(
                               // color: Color(0xfff5f5f5),
                                child: TextFormField(
                                  controller: usernameController,
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
                               // color: Color(0xfff5f5f5),
                                child: TextFormField(
                                  controller: firstNameController,
                                  style: TextStyle(color: Colors.white , fontSize: 18),
                                
                                  decoration: InputDecoration(
                                   
                                    focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.transparent)
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.transparent)
                                   ),
                                   hintText: "First Name",
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
                               // color: Color(0xfff5f5f5),
                                child: TextFormField(
                                  controller: lastNameController,
                                  style: TextStyle(color: Colors.white , fontSize: 18),
                                
                                  decoration: InputDecoration(
                                   
                                    focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.transparent)
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.transparent)
                                   ),
                                   hintText: "Last Name",
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
                               // color: Color(0xfff5f5f5),
                                child: TextFormField(
                                  controller: emailController,
                                  style: TextStyle(color: Colors.white , fontSize: 18),
                                
                                  decoration: InputDecoration(
                                   
                                    focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.transparent)
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.transparent)
                                   ),
                                   hintText: "E-mail",
                                   hintStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                      fontSize: 20 , color: Colors.white24 , fontWeight: FontWeight.w600
                                    ),
                                    prefixIcon: Icon(Icons.alternate_email , size: 22, color: Colors.white,),
                                  
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
                                  controller: password1Controller,
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
                                         Container(
                                     //    height: 50,
                               // color: Color(0xfff5f5f5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                    child: TextFormField(
                                  controller: password2Controller,
                                  obscureText: true,
                                  style: TextStyle(color: Colors.white , fontSize: 20),
                                  decoration: InputDecoration(
                             
                                        focusedBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.transparent)
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.transparent)
                                   ),
                                   hintText: "Confirm Password",
                                   hintStyle: TextStyle(
                                        fontStyle: FontStyle.normal,
                                          fontSize: 20 , color: Colors.white24 , fontWeight: FontWeight.w600
                                        ),
                                        prefixIcon: Icon(Icons.lock , size: 22, color: Colors.white,),
                                  
                                  ),
                                
                                ),
                                    ),
                                    
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
                                          if(password1Controller.text != password2Controller.text) {
                                            Scaffold.of(context).showSnackBar(SnackBar(
                                          backgroundColor: Colors.redAccent,
                                           content: Text("Password are not match !", 
                                           textAlign: TextAlign.center,)
                                           ));
                                          } else {
                                         dynamic result = await Provider.of<UserProvider>(context).sign_up(usernameController.text, password1Controller.text , firstNameController.text, lastNameController.text, emailController.text);
                                         if(result != 201) {
                                           Scaffold.of(context).showSnackBar(SnackBar(
                                          backgroundColor: Colors.redAccent,
                                           content: Text(login.signup_response_message, 
                                           textAlign: TextAlign.center,)
                                           ));
                                         
                                         } else {
                                             Navigator.push<dynamic>(context,
                              MaterialPageRoute<dynamic>(builder: (context) => SignIn(msg: "done")));
                         
                                         }
                                          }
                                        },
                                        color: Colors.white,
                                        padding: EdgeInsets.only(top: 20, bottom: 20),
                                        child: Container(
                                       
                                          width: MediaQuery.of(context).size.width,
                                          child: Text(login.signup_button, textAlign: TextAlign.center,
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
                       
                        ],
                    )
  
              ),
         
              );
           
  }

}