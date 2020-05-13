import 'package:flutter/material.dart';

class Pet_Detail extends StatefulWidget {
  @override
  _Pet_DetailState createState() => _Pet_DetailState();
}

class _Pet_DetailState extends State<Pet_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
              child: Column( 
                children: <Widget>[
                   SizedBox( height: 70, ),
                    Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                   Text("TUFFY" , textAlign: TextAlign.start ,style: TextStyle(fontFamily: 'Raleway' , fontSize: 32)),
                    ],
                   ),
                   SizedBox( height: 20, ),
                   Image.asset('assets/images/puppy.jpg') ,
                   ExpansionTile(
                     title: Text("Events" , style: TextStyle(color: Colors.black)),
                     children: <Widget>[
                       Container(
                         padding: EdgeInsets.all(10),
                         child: Text("I didn't found any API url to get events relate to only that pet"))
                     ],
                     trailing: Icon(Icons.arrow_forward, color: Colors.black54),
                     ) 
                                    
                ],
              ),
              ),
          ),
          ),
        )
   
        ],
      ),
    );
  }
}