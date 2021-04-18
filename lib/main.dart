import 'package:flutter/material.dart';
import 'package:hmsepm/pages/LSOptions.dart';
import 'package:hmsepm/pages/book.dart';
import 'package:hmsepm/pages/loading.dart';
import 'package:hmsepm/pages/gallery.dart';
import 'package:hmsepm/pages/info.dart';


void main() => runApp(MaterialApp(initialRoute: '/login', routes: {
      '/': (context) => Loading(),
      '/login': (context) => Login(),
      '/gallery': (context) => Gallery(),
      '/info': (context) => Info(),
      '/book': (context) => Book(),
    },
    ));
