import 'package:flutter/material.dart';
import 'package:medihelp/UI/HomePage.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(color: Colors.white,),
        Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: SafeArea(
                child: Center(
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image.asset("images/logo.png"),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Image.asset("images/login.png"),
            ),
            Flexible(
              flex: 5,
              child: Container(),
            )
          ],
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height-450.0,),
                Container(
                  margin: EdgeInsets.all(8.0),
                  height: MediaQuery.of(context).size.height-390.0,
                  width: MediaQuery.of(context).size.width-26.0,
                  child: Card(
                    elevation: 5.0,
                    color: Colors.grey.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(child: Text("Login", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Color(0xff29abe2),),)),
                          Text("Username", style: TextStyle(fontSize: 22.0, color: Color(0xff2e3192),),),
                          TextField(
                            onChanged: (String value){
                              setState(() {
                                username = value;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: "username"
                            ),
                          ),
                          SizedBox(height: 19.0,),
                          Text("Password", style: TextStyle(fontSize: 22.0, color: Color(0xff2e3192),),),
                          TextField(
                            obscureText: true,
                            onChanged: (String value){
                              setState(() {
                                password = value;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: "password"
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(),
                              Text("Forgot Password?", style: TextStyle(fontSize: 20.0, color: Colors.lightBlue,),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width-26.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.centerRight,
                      begin: Alignment.centerLeft,
                      colors: [Color(0xff29abe2), Color(0xff2e3192)]
                    ),
                  ),
                  child: Center(child: FlatButton(
                      onPressed: (){
                        if(username != null && username != "" && password != null && password != ""){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext c){
                              return HomePage();
                            })
                          );
                        }
                      },
                      child: Text("Sign In", style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.white,),))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("New user?", style: TextStyle(fontSize: 25.0, color: Colors.black,),),
                    Text("Sign UP NOW", style: TextStyle(fontSize: 25.0, color: Colors.blue,),),
                  ],
                ),
                SizedBox(height: 5.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(),
                    SizedBox(),
                    SocialMediaIcon("f", Colors.blue),
                    SocialMediaIcon("G", Colors.red),
                    SizedBox(),
                    SizedBox(),
                  ],
                ),
              ],
            )
          ),
        )
      ],
    );
  }
  
  Widget SocialMediaIcon(String letter, Color color){
    return CircleAvatar(
      radius: 18.0,
      backgroundColor: color,
      child: Text(letter, style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),),
    );
  }
}

