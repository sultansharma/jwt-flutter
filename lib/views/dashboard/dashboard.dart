import 'package:drf_flutter/class/sign_in_class.dart';
import 'package:drf_flutter/theme/hex_color.dart';
import 'package:drf_flutter/views/dashboard/events_page.dart';
import 'package:drf_flutter/views/dashboard/home_page.dart';
import 'package:drf_flutter/views/dashboard/pets_page.dart';
import 'package:drf_flutter/views/dashboard/profile_page.dart';
import 'package:flutter/material.dart';
import 'dart:io';



class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => exit(0),
                /*Navigator.of(context).pop(true)*/
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
  @override
 int _selectedPage = 0;
  List<Widget> pageList = List<Widget>();
  
  @override
  void initState() {
    pageList.add(Home_Page());
    pageList.add(Profile_Page());
    pageList.add(Events_Page());
    pageList.add(Pets_Page());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
          child: Hero(
                  tag: "main",
                  createRectTween: _createRectTween,
        child:  Scaffold(
       
        body:  IndexedStack(
          index: _selectedPage,
          children: pageList,
        ),
           bottomNavigationBar: SizedBox(
          height: 65,
                child: BottomNavigationBar(
                  selectedItemColor: HexColor("7788d8"),
                  selectedIconTheme: IconThemeData(size: 40),
                  unselectedIconTheme: IconThemeData(size: 15),
            elevation: 5.0,
            
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedPage,
        
          onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon:ImageIcon(AssetImage('assets/icons/home.png') ),
                title: SizedBox(
                  height: 3,
                  child: Text("")),
              ),  
               BottomNavigationBarItem(
                icon:ImageIcon(AssetImage('assets/icons/iconeat.png') ),
                title: SizedBox(
                  height: 3,
                  child: Text("")),
              ),   
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/events.png') ),
                title: SizedBox(
                  height: 3,
                  child: Text("")),
              ),
            BottomNavigationBarItem(
                icon:ImageIcon(AssetImage('assets/icons/profile.png' ,), ),
                title: SizedBox(
                  height: 3,
                  child: Text("")),
              ), 
              
            ],
          ),
        ),

      ),
    )
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      //  final CityProvider _detail = Provider.of<CityProvider>(context , listen: false);
      //  _detail.userDetail();
    });
  }
    static RectTween _createRectTween(Rect begin, Rect end) {
    return CircularRectTween(begin: begin, end: end);
  }
}