import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(login_ui());

class login_ui extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LoginUi",
      home: myhome(),
    );
  }
}

class myhome extends StatefulWidget {
  @override
  _myhomeState createState() => _myhomeState();
}

class _myhomeState extends State<myhome> {

  final _formkey = GlobalKey<FormState>();
  String _username,_password= "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/bg.jpg",
            fit: BoxFit.cover,
          ),
          Form(
            key: _formkey,
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                    "assets/images/icon.png"
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: TextFormField(
                      validator: (name){
                        Pattern pattern =
                         r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                         RegExp regex = new RegExp(pattern);
                         if (regex.hasMatch(name))
                             return null;
                         else
                             return 'Invalid username';
                      },
                    decoration: InputDecoration(
                      hintText: "User Name",
                      border: InputBorder.none,
                    ),
                    textInputAction: TextInputAction.next,
                    onSaved: (name)=> _username = name,
                  ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      validator: (password){
                       Pattern pattern =
                         r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                       RegExp regex = new RegExp(pattern);
                       if (regex.hasMatch(password))
                          return null;
                       else
                          return 'Invalid password';
                      },
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.lock),
                    ),
                    textInputAction: TextInputAction.done,
                    onSaved: (password)=> _password = password,
                  ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: MaterialButton(
                    padding: EdgeInsets.only(top: 4.0),
                    onPressed: () {
                      if(_formkey.currentState.validate()){
                         _formkey.currentState.save();
                       }
                    },                   
                    elevation: 20.0,
                    color: Colors.blue,
                    splashColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    height: 50,
                    minWidth: 120,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        letterSpacing: 3.5,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

