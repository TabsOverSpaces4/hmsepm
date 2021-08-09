import 'package:flutter/material.dart';
import 'package:hmsepm/Widgets/bottomtabs.dart';
import 'package:hmsepm/tabs/home.dart';
import 'package:hmsepm/tabs/savedtab.dart';
import 'package:hmsepm/tabs/search.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    
  ));
}

class Book extends StatefulWidget {
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<Book> {
  
  PageController _tabsPageController;
  int _selectedTab = 0;
  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Expanded(
          child: PageView(
            controller: _tabsPageController,
            onPageChanged: (num) {
              setState(() {
                _selectedTab = num;
              });
            },
            children: [
              HomeTab(),
              SearchTab(),
              Savedtab(),
              // Profiletab(),
            ],
          ),
        )),
        Btmtabs(
          selectedTab: _selectedTab,
          tabPressed: (num) {
            setState(() {
              _tabsPageController.animateToPage(num,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic);
            });
          },
        ),
      ],
    ));
  }
}
