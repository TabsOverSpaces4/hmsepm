import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hmsepm/Widgets/CustomInput.dart';
import 'package:hmsepm/Widgets/custom_button.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error!"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void _submitForm() async {
    // Set the form to loading state
    setState(() {
      _registerformLoading = true;
    });

    String _createAccountFeedback = await _createAccount();
    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);

      setState(() {
        _registerformLoading = false;
      });
    } else {
      //Sign in was successful and the user was routed towards the homescreen using pop funciton
      Navigator.pop(context);
    }
  }

  // Create a new user account
  Future<String> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    } on FirebaseAuthException catch (e) {
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

  //Default Form Loading State
  bool _registerformLoading = false;

  //Form input field Values
  String _registerEmail = "";
  String _registerPassword = "";

  // Focus Node for the input fields
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

    return Scaffold(
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
                          "Sign Up",
                          style: TextStyle(
                              fontSize: deviceWidth / 32, color: Colors.white),
                        ),
                      ],
                    )),
                Container(
                    child: Column(
                      children: [
              CustomInpt(
                hintText: "Email...",
                onChanged: (value) {
                  _registerEmail = value;
                },
                onSubmitted: (value) {
                  _passwordFocusNode.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              CustomInpt(
                hintText: "Password...",
                onChanged: (value) {
                  _registerPassword = value;
                },
                focusNode: _passwordFocusNode,
                isPasswordField: true,
                onSubmitted: (value) {
                  _submitForm();
                },
              ),
              Custombtn(
                text: "Create Account",
                onPressed: () {
                  _submitForm();
                },
                outlineBtn: false,
                isLoading: _registerformLoading,
              )
            ],
                    ),
                  ),
               ] ),
                Container(
                  margin: EdgeInsets.only(
                      top: deviceWidth * .58,
                      left: deviceHorizontal * .2,
                      right: deviceHorizontal * .2),
                  height: deviceWidth * .08,
                  width: deviceHorizontal * .8,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/form');
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
                    child: TextButton(
                      child: Text(
                        "Don't have an account? Create on here...",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/form');
                      },
                    )),
              ],
            ),
          );
          
    
  }
}
