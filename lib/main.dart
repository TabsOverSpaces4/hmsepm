import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hmsepm/pages/LSOptions.dart';
import 'package:hmsepm/pages/book.dart';
import 'package:hmsepm/pages/loading.dart';
import 'package:hmsepm/pages/gallery.dart';
import 'package:hmsepm/pages/info.dart';
import 'package:hmsepm/pages/Signin.dart';
import 'package:hmsepm/pages/form.dart';
import 'package:hmsepm/pages/bill.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/': (context) => Loading(),
      '/login': (context) => Login(),
      '/gallery': (context) => Gallery(),
      '/info': (context) => Info(),
      '/book': (context) => Book(),
      '/signin': (context) => SignIn(),
      '/form': (context) => FormScreen(),
      '/bill': (context) => Bill(),
    },
  ));
}
