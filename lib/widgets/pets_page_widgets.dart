import 'package:drf_flutter/provider/user_provider.dart';
import 'package:drf_flutter/theme/hex_color.dart';
import 'package:drf_flutter/views/dashboard/pages/add_pet.dart';
import 'package:drf_flutter/views/dashboard/pages/pet_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget header_text(dynamic context) {
return  SliverToBoxAdapter(
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
                   Text("My pet" , textAlign: TextAlign.start ,style: TextStyle(fontFamily: 'Raleway' , fontSize: 32)),
                   InkWell(
                     onTap: (){
                     Navigator.push<dynamic>(context,
                     MaterialPageRoute<dynamic>(builder: (context) => Add_Pet()));
                           
                     },
                     child: Text("+ Add" , style: TextStyle(color: Colors.green , fontWeight: FontWeight.w500),))
                   ],
                 ),
    
                   SizedBox( height: 20, ),
                                         
                ],
              ),
              ),
          ),
          ),
        );
                    
}

Widget pets_list(dynamic context){
return Consumer<UserProvider>(builder: (_, pets, __) => 
pets.pets_list == null ? SliverToBoxAdapter(child: Text("Loading")) : 
pets.pets_list.length != 0 ?  SliverList(
    delegate: SliverChildBuilderDelegate(
    (_, index) => InkWell(
         onTap: (){
             Navigator.push<dynamic>(context,
             MaterialPageRoute<dynamic>(builder: (context) => Pet_Detail()));
                           
          },
          child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300]
          )
        ),
        child: ListTile(
          leading: CircleAvatar(
              
              radius: 20,
              backgroundImage: AssetImage('assets/images/puppy.jpg'),
              backgroundColor: HexColor("7788d8"),
             
            
          ),
          title: Text(pets.pets_list[index]['name'].toString().toUpperCase(), style: TextStyle(
           fontWeight: FontWeight.w500,
           fontFamily: 'Raleway'
          ),),
          subtitle: Text(pets.pets_list[index]['species_name']) ,
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    ),
    childCount: pets.pets_list.length,
  )
  
  ) :
SliverToBoxAdapter(child: Text("No Pet"))
);
}
