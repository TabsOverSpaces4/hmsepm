import 'package:flutter/material.dart';
import 'package:hmsepm/pages/LSOptions.dart';
import 'package:hmsepm/pages/loading.dart';

void main() => runApp(MaterialApp(initialRoute: '/login', routes: {
      '/': (context) => Loading(),
      '/login': (context) => Login(),
    },
    ));
