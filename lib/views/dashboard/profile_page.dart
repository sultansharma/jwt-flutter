import 'package:drf_flutter/provider/user_provider.dart';
import 'package:drf_flutter/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile_Page extends StatefulWidget {
  @override
  _Profile_PageState createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
   void log_out() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Provider.of<UserProvider>(context).logout();
    await Navigator.push<dynamic>(context,
    MaterialPageRoute<dynamic>(builder: (context) => Splash_screen()));
               
   } 
  @override
  Widget build(BuildContext context) {
 return Scaffold(
          body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                          SizedBox(
                    height: 60,
                    ),
                     Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                   Text("Account" , textAlign: TextAlign.start ,style: TextStyle(fontFamily: 'Raleway' , fontSize: 32)),
                   InkWell(
                     onTap: (){
                     log_out();
                     },
                     child: Text(" Logout" , style: TextStyle(color: Colors.red , fontWeight: FontWeight.w500),))
                   ],
                 ),
    
                    SizedBox(
                    height: 30,
                    ),
                   Consumer<UserProvider>(builder: (_, user, __) => Text(
                     user.user_details.toString(),
                   ))
                   
                  ],
                ),
              )
            )
          ],
      ),
    );
 
  }
}