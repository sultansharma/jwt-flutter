import 'package:drf_flutter/views/dashboard/pages/add_pet.dart';
import 'package:drf_flutter/widgets/pets_page_widgets.dart';
import 'package:flutter/material.dart';

class Pets_Page extends StatefulWidget {
  @override
  _Pets_PageState createState() => _Pets_PageState();
}

class _Pets_PageState extends State<Pets_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: CustomScrollView(
        slivers: <Widget>[
         header_text(context),
         pets_list(context) 
        ],
      ),
    );
  
  }
}