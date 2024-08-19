import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}): super(key: key);
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String username, password) async {

    try{

      Response response = await post(
        Uri.parse('https://dummyjson.com/auth/login'),
        body: {
          'username' : username,
          'password' : password
        }
      );

      if(response.statusCode == 200){
        var data= jsonDecode(response.body.toString());
        print(data);
        print('login successfully');
      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 23, 237, 215),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Username'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password'
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                login(usernameController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 23, 237, 215),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Login'),),
              ),
            )
          ],
        ),
      ),
    );
  }
}