import 'dart:async';
import 'package:drf_flutter/provider/user_provider.dart';
import 'package:drf_flutter/theme/hex_color.dart';
import 'package:drf_flutter/views/dashboard/dashboard.dart';
import 'package:drf_flutter/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_screen extends StatefulWidget {
  @override
  _Splash_screenState createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {

Widget _flightShuttleBuilder(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext, 
  BuildContext toHeroContext,
) {
  return DefaultTextStyle(style: DefaultTextStyle.of(toHeroContext).style,
  
   child: toHeroContext.widget);
}

void redirect() {

}

  @override
 Widget build(BuildContext context) {
    return Scaffold(
     body: 
 Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 130, left: 15),
              child: Row(
              children: <Widget>[
                InkWell(
                  onTap: (){
                   },
                                  child: Hero(
                    tag: "main",
                    flightShuttleBuilder : (
                  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext, 
  BuildContext toHeroContext,
) {
return Container(
   width: 50,
   decoration: BoxDecoration(
   color: HexColor("7788d8"),
   shape: BoxShape.circle
  )
);

   
} ,
child: CircleAvatar(
  backgroundColor: HexColor("7788d8"),
  radius: 40,
  child: CircleAvatar(
    backgroundColor: Colors.white,
    radius: 38,
      child: CircleAvatar(
      radius: 35,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage('assets/images/puppy2.jpg')
     
    ),
  ),
),
               ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),

                  child:Consumer<UserProvider>(builder: (_, login, __) =>
                   login.userLogged == "yes" ? 
                   InkWell(
                     onTap: (){
                          Navigator.push<dynamic>(context,
                                       // MaterialPageRoute<dynamic>(builder: (context) => SignIn())
                                        PageRouteBuilder<dynamic>(
                                          transitionDuration: Duration(seconds: 1),
                                          pageBuilder: (_,__,___) => DashBoard())
                                        );
               
                     },
                                        child: Text("DASHBOARD" , style: TextStyle(color: HexColor("7788d8") , fontWeight: FontWeight.w300,
                  fontSize: 20
                  ) ),
                   ): login.userLogged == "no" ? 
                  InkWell(
                    onTap: (){
                         Navigator.push<dynamic>(context,
                                       // MaterialPageRoute<dynamic>(builder: (context) => SignIn())
                                        PageRouteBuilder<dynamic>(
                                          transitionDuration: Duration(seconds: 1),
                                          pageBuilder: (_,__,___) => SignIn())
                                        );
               
                    },
                                      child: Text("SIGN IN / UP" , style: TextStyle(color: HexColor("7788d8") , fontWeight: FontWeight.w300,
                    fontSize: 20
                    ) ),
                  ) :
                   Text("LOADING...." , style: TextStyle(color: HexColor("7788d8") , fontWeight: FontWeight.w300,
                  fontSize: 20
                  ),),
                )
                )
              ],
              ),
            ),
           Image.asset('assets/images/splash_screen.png')
          ],
        ),
      )
     ,
    );
   
      
     
  }
}
