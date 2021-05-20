import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hmsepm/Widgets/CustomInput.dart';
import 'package:hmsepm/Widgets/custom_button.dart';
import 'package:hmsepm/pages/Signup.dart';


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
                child: Text("Close"),
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

    return Scaffold(
          backgroundColor: Colors.blueGrey[900],
          body: ListView(children: [
            Column(
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
                    SizedBox(height: deviceWidth * .01),
                Container(
                 
                    child: Column(
            children: [
              CustomInpt(
                    hintText: "Email...",
                    onChanged: (value) {
                      _loginEmail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: deviceWidth * .01),

              CustomInpt(
                    hintText: "Password...",
                    onChanged: (value) {
                      _loginPassword = value;
                    },
                    focusNode: _passwordFocusNode,
                    isPasswordField: true,
                    onSubmitted: (value) {
                      _submitForm();
                    },
                  ),
                  SizedBox(height: deviceWidth * .01),
                    Custombtn(
                    text: "Login",
                    onPressed: () {
                      _submitForm();
                    },
                    isLoading: _loginFormLoading,
                  ),
                  SizedBox(height: deviceWidth * .01),
                  //   Custombtn(
                  //   text: "New user? Sign up here...",
                  //   onPressed: () {
                  //    Navigator.pushNamed(context, '/SignupPage');
                  //   },
                    
                  // ),
                  Custombtn(
              text: "Don't have an account? SignUp here",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
              outlineBtn: true,
            ),
                ],
              ),
          //  Padding(
          //   padding: const EdgeInsets.only(bottom: 16.0),
          //   child: Custombtn(
          //     text: "Don't have an account? SignUp here",
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => SignupPage()));
          //     },
          //     outlineBtn: true,
          //   ),
          // ),
                  
      ),
                ],
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_outlined),
            backgroundColor: Colors.teal[400],
          ),
    );
  }
}
  
