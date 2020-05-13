import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
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
                    Align(
                    alignment: Alignment.topLeft,
                      child: Text("Home" , style: TextStyle(fontFamily: 'Raleway' , fontSize: 32,
                     
                      ))),
                    SizedBox(
                    height: 30,
                    ),
                  ],
                ),
              )
            )
          ],
      ),
    );
  }
}