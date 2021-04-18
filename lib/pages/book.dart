import 'package:flutter/material.dart';
import 'package:hmsepm/pages/travelcard.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Book(),
  ));
}

class Book extends StatefulWidget {
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<Book> {

  List<String> urls = [
    "https://images.unsplash.com/photo-1605346434674-a440ca4dc4c0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGhvdGVsJTIwcm9vbXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1568495248636-6432b97bd949?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG90ZWwlMjByb29tfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1568495248636-6432b97bd949?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG90ZWwlMjByb29tfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1568495248636-6432b97bd949?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG90ZWwlMjByb29tfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1568495248636-6432b97bd949?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG90ZWwlMjByb29tfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1518733057094-95b53143d2a7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTN8fGhvdGVsJTIwcm9vbXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1561296275-ed0cadb83832?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGJhbmdhbG9yZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://www.shieldsgazette.com/images-i.jpimedia.uk/imagefetch/https://jpgreatcontent.co.uk/wp-content/uploads/2020/04/spain.jpg",
    "https://images.unsplash.com/photo-1549366021-9f761d450615?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d2lsZGxpZmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "https://lp-cms-production.imgix.net/features/2018/06/byrsa-hill-carthage-tunis-tunisia-2d96efe7b9bf.jpg"
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey[900],
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              "Welcome to HMS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Pick from our vast selections of rooms",
              style: TextStyle(
                color: Colors.teal[400],
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Color(0x55434343),
              child: TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Or, search for it...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.teal[400],
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            
            DefaultTabController(
              length: 3,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.teal[400],
                      unselectedLabelColor: Colors.grey[350],
                      labelColor: Colors.teal[400],
                      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      tabs: [
                        Tab(
                          text: "Trending",
                        ),
                        Tab(
                          text: "Tourism",
                        ),
                        Tab(
                          text: "Favorites",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      child: TabBarView(
                        children: [
                          //Now let's create our first tab page
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                //Now let's add and test our first card
                                travelCard(
                                    urls[0], "Single Bed", "Capacity: 1", 3),
                                travelCard(urls[2], "Double Bed", "Capacity: 2", 4),
                                travelCard(
                                    urls[5], "Founders Suite", "Capacity: 4", 5),
                              ],
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                
                                travelCard(urls[6], "Visit Kodai", "37Kms", 4),
                                travelCard(urls[8], "bannerghatta national park",
                                    "14kms", 4),
                              ],
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey[350],
        selectedItemColor: Colors.teal[400],
        backgroundColor: Colors.blueGrey[900],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text("BookMark"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text("Destination"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text("Notification"),
          ),
        ],
      ),
    );
  }
}