import 'package:drf_flutter/provider/user_provider.dart';
import 'package:drf_flutter/theme/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Add_Pet_class extends StatefulWidget {
  @override
  _Add_Pet_classState createState() => _Add_Pet_classState();
}
  TextEditingController petNameController = new TextEditingController();
  TextEditingController petSpeciesController = new TextEditingController();
class _Add_Pet_classState extends State<Add_Pet_class> {
     final snackBar = SnackBar(
            backgroundColor: Colors.redAccent,
            content: 
                 Text('Please Provide name or valid species no(1-5) !' , 
                textAlign: TextAlign.center,)
          );
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
              child: Column(
                children: <Widget>[
                   SizedBox(
                  height: 60,
                  ),
                  Align(
                  alignment: Alignment.topLeft,
                    child: Text("Add your pet" , style: TextStyle(fontFamily: 'Raleway' , fontSize: 32,
                   
                    ))),
                  SizedBox(
                  height: 30,
                  ),
                  CircleAvatar(
                  backgroundColor: HexColor("7788d8"),
                  radius: 50,
                  child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/icons/profile.png' ,),
                  ),
                  ),
                    Container(
                                    margin: EdgeInsets.only(top:30),
                                  child: TextFormField(
                                    controller: petNameController,
                                    style: TextStyle(color: Colors.black , fontSize: 18),
                                    decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                     ),
                                     enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(color: Colors.grey[300])
                                     ),
                                     hintText: "Pet name",
                                     hintStyle: TextStyle(
                                      fontStyle: FontStyle.normal,
                                        fontSize: 20 , color: Colors.black54, fontWeight: FontWeight.w400
                                      ),
                                     
                                    ),
                                  
                                  ),
                                ),
                    Container(
                                    margin: EdgeInsets.only(top:10),
                                  child: TextFormField(
                                   controller: petSpeciesController,
                                    style: TextStyle(color: Colors.black , fontSize: 18),
                                    decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                     ),
                                     enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(color: Colors.grey[300])
                                     ),
                                     hintText: "Pet Species",
                                     hintStyle: TextStyle(
                                      fontStyle: FontStyle.normal,
                                        fontSize: 20 , color: Colors.black54, fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  
                                  ),
                                ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("*1 for Dog , 2 for Cat etc.")
                         , 
                         Container(
                           margin: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             border: Border.all(
                               color:Colors.red
                             )
                           ),
                           padding: EdgeInsets.all(10),
                         child: Center(
                           child: Text("a API url needed for getting total species list",
                           style: TextStyle(color: Colors.red)
                           ),
                         ),
                          )
                        ],
                      ),

                    )                 
                    ,RaisedButton(
                     color: HexColor("7788d8"),
                      onPressed: () async {
                        if(petNameController.text == "") {
                         Scaffold.of(context).showSnackBar(   SnackBar(
                          backgroundColor: Colors.redAccent,
                        content: 
                       Text('Please Provide name' , 
                       textAlign: TextAlign.center,)));
                        
          
                        } else {
                      dynamic result = await Provider.of<UserProvider>(context).add_pet(petNameController.text, petSpeciesController.text);
                      if(result == "done")   {
                       Navigator.pop(context);
                      } else {
                        Scaffold.of(context).showSnackBar(snackBar);
                      } 
                        }
                              
                    },
                    child: Container(
                   
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(18.0),
                    child: Consumer<UserProvider>(builder: (_, pet, __) => Text(pet.add_pet_button,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white), ),),
                    ),
                    ) ],
              ),
              ),
          ),
          ),
        )
        ],
      )
    ;
  }
}