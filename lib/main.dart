import 'package:flutter/material.dart';
import 'package:hmsepm/pages/LSOptions.dart';
import 'package:hmsepm/pages/book.dart';
import 'package:hmsepm/pages/landingpage.dart';
import 'package:hmsepm/pages/loading.dart';
import 'package:hmsepm/pages/gallery.dart';
import 'package:hmsepm/pages/info.dart';
import 'package:hmsepm/pages/Signin.dart';
import 'package:hmsepm/pages/form.dart';
import 'package:hmsepm/pages/bill.dart';
import 'package:hmsepm/pages/Signup.dart';



void main() => runApp(MaterialApp(initialRoute: '/landingpage', routes: {
      '/': (context) => Loading(),
      '/landingpage': (context) => Landingpage(),
      '/login': (context) => Login(),
      '/gallery': (context) => Gallery(),
      '/info': (context) => Info(),
      '/book': (context) => Book(),
      '/signin': (context) => Loginpage(),
      '/form': (context) => FormScreen(),
      '/bill': (context) => Bill(),
      '/signup': (context) => SignupPage(),
     
    },
    
    )
    );
    
