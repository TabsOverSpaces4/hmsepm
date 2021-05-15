import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';


class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              TextButton(
                child: Text("Close Dialog"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }

  // Create a new user account
  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    // Set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });

    // Run the create account method
    String _loginFeedback = await _loginAccount();

    // If the string is not null, we got error while create account.
    if(_loginFeedback != null) {
      _alertDialogBuilder(_loginFeedback);

      // Set the form to regular state [not loading].
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  // Default Form Loading State
  bool _loginFormLoading = false;

  // Form Input Field Values
  String _loginEmail = "";
  String _loginPassword = "";

  // Focus Node for input fields
  FocusNode _passwordFocusNode;


  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }


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
                                image: AssetImage("lib/assets/images/logo.png"),
                              )),
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
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              hintText:
                                  "Password is the Check-in Date in the format: DD-MM-YYYY",
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
                      Navigator.pushNamed(context, '/bill');
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
                        "Don't have an account? Create on here...",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
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
          )),
    );
  }
}
  
