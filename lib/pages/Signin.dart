import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.height;
    final deviceHorizontal = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: ListView(children: [
          Stack(
            children: [
              Container(
                  height: deviceWidth * .4,
                  width: double.infinity,
                  color: Colors.teal[400],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: deviceWidth * .08),
                        height: deviceWidth * .14,
                        width: deviceWidth * .14,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("lib/assets/images/logo.png"),)
                            ),
                      ),
                      SizedBox(height: deviceWidth * .01),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: deviceWidth / 32, color: Colors.white),
                      ),
                    ],
                  )),
              
                  Container(
                    margin: EdgeInsets.only(
                        top: deviceWidth * .32, left: deviceWidth * .02),
                    height: deviceWidth * .3,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: deviceHorizontal * .1,
                          right: deviceHorizontal * .1,
                          top: deviceWidth * .025),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Booking ID",
                                hintText: "ROFLMAO123",
                                suffixIcon: Icon(Icons.email_outlined),
                                ),
                          ),
                          SizedBox(height: deviceWidth * .01),
                          TextFormField(obscureText: true,
                            decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "Password is the Check-in Date in the format: DD-MM-YYYY",
                              
                                suffixIcon: Icon(Icons.remove_red_eye_outlined)),
                          ),
                          SizedBox(height: deviceWidth * .01),
                          
                        ],
                      ),
                    ),
                  ),
                
              
              Container(
                margin: EdgeInsets.only(
                    top: deviceWidth * .58,
                    left: deviceHorizontal * .2,
                    right: deviceHorizontal * .2),
                height: deviceWidth * .08,
                width: deviceHorizontal * .8,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/book');
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.teal[400],
                ),
              ),
              
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: deviceWidth * .68,
                  ),
                  child: FlatButton(
                    child: Text(
                      "Haven't booked yet? Click here to book now !",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/book');
                    },
                  )),
            ],
          ),
        ]),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_outlined),
        backgroundColor: Colors.teal[400],
    )
      ),
    );
  }
}