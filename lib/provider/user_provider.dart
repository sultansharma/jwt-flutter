import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drf_flutter/config/config.dart';

//------This page have------
//Check_login - if we have token - validate token
//Login - Generate token - save to shared_prefer - show details.
//Register


class UserProvider with ChangeNotifier {
  UserProvider() {
   check_login();
  }
  String userLogged = null;
  String auth_token = null;
  String check_result = "";
  String login_button = "Sign In";
  String signup_button = "Sign Up";
  String login_response = null;
  String add_pet_button = "Add now";
  String signup_response = null;
  String response_message = null;
  String signup_response_message = null;
  dynamic user_details = null;
  List pets_list = null;



  Future<dynamic> check_login() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String refresh_token = prefs.getString('refresh_token');
  if(refresh_token != null) {
  Future.delayed(const Duration(seconds: 1), () async {
   dynamic refresh = await refresh_token_login(refresh_token);
   if(refresh == "done") {
     //Token generated
    print("token generated");
    userLogged = "yes";
    notifyListeners();
   } else {
     //Token Expired
     print("token expired");
      userLogged = "yes";
      notifyListeners();
     return "notlogged";
   }
   return refresh_token;
  });
  } else {
    print("not logged");
    userLogged = "no";
    notifyListeners();
  }
 
  }


  Future<dynamic> refresh_token_login(String refresh_token) async {
    final response = await http.post("${APIurl}/api/token/refresh/" , body: {
    "refresh" : refresh_token,
    }); 
    if(response.statusCode == 200) {
      dynamic res = jsonDecode(response.body);
    //Save Shared Prefrence
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("access_token", res['access']);
    await user_Details();
    await get_Pets();
    return "done";
    } else {
      return "not-done";
    }
  }

  Future<dynamic> sign_in(String username, String password) async {
    login_response = null;
    login_button = "Signing..";
    notifyListeners();
    final response = await http.post("${APIurl}/api/token/" , body: {
    "username" : username,
    "password" : password
    });
    if(response.statusCode == 200 ) {
    dynamic res = jsonDecode(response.body);
  //Save Shared Prefrence
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("access_token", res['access']);
    prefs.setString("refresh_token", res['refresh']);
  //Get User details
    await user_Details();
    login_button = "Sign In";
    notifyListeners();
    await get_Pets();
    return response.statusCode;
    } else {
      login_button = "Sign In";
      notifyListeners();
      print("Login details are invalid");
     return response.statusCode;
    }

  }
  
  Future<dynamic> sign_up(String username, String password, String firstname , String lastname, String emailid) async {
    signup_response = null;
    print(emailid);
    signup_button = "Loading..";
    notifyListeners();
    Map data = <dynamic, dynamic>{
       "username": username,
       "first_name": firstname,
       "last_name": lastname,
       "email": emailid,
       "password": password,
       "password2": password,
    };
    var body = json.encode(data);
    final response = await http.post("${APIurl}/api/jwtauth/register/" , headers:{
    'Content-Type': "application/json",
    }, body: body);
 
     dynamic res = jsonDecode(response.body);
     print(res);
     if(response.statusCode == 201) {
     print("Sign Up");
     return response.statusCode;
     } else {
     if(res['username'] != null) {
       print("username");
     signup_response_message = "Username must be unique !";
     signup_button = "Sign Up";
     notifyListeners();
     return response.statusCode;
     } else if(res['email'] != null) {
       print("email");
     signup_response_message = "Email address must be unique !";
     signup_button = "Sign Up";
     notifyListeners();
     return response.statusCode;
     } else {
     signup_button = "Sign Up";
     signup_response_message = "Unknown Error , try again !";
     notifyListeners();
     return response.statusCode;
     }
     }

    // if(response.statusCode == 201) {
    //   signup_button = "Sign Up"; 
    //   signup_response = "0";
    //   dynamic res = jsonDecode(response.body);
    //   signup_response_message = res.toString();
    //   sign_in(username, password);
    // } else {
    //   dynamic res = jsonDecode(response.body);
    //   print(res);
    //   signup_button = "Sign Up";
    //   signup_response = "1";
    //   signup_response_message = res.toString();
    //   notifyListeners();
    // }
    
  }

  Future<dynamic> user_Details() async {
    print("Getting user details");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token');
    final response = await http.get('${APIurl}/pets/api/v2/user_info', headers: {
    "Authorization": "Bearer ${access_token}"
    },  );
    dynamic res = jsonDecode(response.body);
    user_details = res;
    notifyListeners();
    print(res);
  }

  Future<dynamic> logout() async {
    print("Log - Out");
    auth_token = null;
    login_response = null;
    response_message = null;
    print(auth_token);
    notifyListeners();
    check_login();
  }
  
  Future<dynamic> get_Pets() async {
    print("Getting pets");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token');
    final response = await http.get('${APIurl}/pets/api/v2/pets/', headers: {
    "Authorization": "Bearer ${access_token}"
    } );
    dynamic res = jsonDecode(response.body);
    print(res);
    pets_list = res['results'];
    notifyListeners();
  }

  Future<dynamic> add_pet(String name, dynamic species) async {
    add_pet_button = "Adding..";
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token');
    print(user_details['id']);
    Map data = <dynamic, dynamic>{
       "name": name,
       "species": species,
       "belongs_to": user_details['id']
    };
    var body = json.encode(data);
    final response = await http.post('${APIurl}/pets/api/v2/pets/', headers: {
      'Content-Type': "application/json",
    "Authorization": "Bearer ${access_token}"
    }, body: body );
    print(response.body);
    if(response.statusCode == 201) {
      await get_Pets();
      add_pet_button = "Add now";
      notifyListeners();
      return "done";

    } else {
       add_pet_button = "Add now";
      notifyListeners();
      return "not done";
    }
  }
  }