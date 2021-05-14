import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hmsepm/Widgets/constants.dart';
import 'package:hmsepm/pages/Signin.dart';
import 'package:hmsepm/pages/book.dart';

class Landingpage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
//not connected successfully

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }
//Connection made with firebase
        if (snapshot.connectionState == ConnectionState.done) {
          //Stream builder checks the login state
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${streamSnapshot.error}"),
                  ),
                );
              }

//User login cheeck to be here
              if (streamSnapshot.connectionState == ConnectionState.active) {
                //getting the user
                User _user = streamSnapshot.data;

                if (_user == null) {
                  return SignIn();
                } else {
                  return Book();
                }
              }

              //Checking the auth state
              return Scaffold(
                body: Container(
                    child: Center(
                  child: Text(
                    "Authenticating...",
                    style: Constants.regularHeading,
                  ),
                )),
              );
            },
          );
        }
//inroute initialization
        return Scaffold(
          body: Container(
              child: Center(
            child: Text(
              "Initializing app",
              style: Constants.regularHeading,
            ),
          )),
        );
      },
    );
  }
}
