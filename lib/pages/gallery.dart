import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
 
class Gallery extends StatefulWidget {
  Gallery() : super();
 
  final String title = "Carousel Demo";
 
  @override
  CarouselDemoState createState() => CarouselDemoState();
}
 
class CarouselDemoState extends State<Gallery> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1583522862616-c7c405b9e0ed?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHJlc29ydHxlbnwwfDB8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1566550738204-79754bb5427b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHJlc29ydHxlbnwwfDB8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cmVzb3J0fGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1602002418211-9d76470fa71f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cmVzb3J0fGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1529316275402-0462fcc4abd6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fHJlc29ydHxlbnwwfDB8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzb3J0fGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1615880480595-f5f9b4fb530e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHJlc29ydHxlbnwwfDB8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1574169270402-4791df8604f3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE4fHxyZXNvcnR8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ];
 
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
      ),
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Slider
            carouselSlider = CarouselSlider(
              height: 400.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.teal[400] : Colors.teal[300],
                  ),
                );
              }),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: goToPrevious,
                  child: Text("<"), textColor: Colors.teal[400],
                ),
                OutlineButton(
                  onPressed: goToNext,
                  child: Text(">"), textColor: Colors.teal[400],
                  
                ),
              ],
            ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        child: const Icon(Icons.arrow_back_ios_outlined),
        backgroundColor: Colors.teal[400],
    )
    );
  }
 
  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
 
  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}