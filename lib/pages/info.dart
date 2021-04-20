import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp(
      home: Info(),
    ));

class Info extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<Info> {
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            ninjaLevel += 1;
          });
        },
        backgroundColor: Colors.teal[400],
        child: Icon(Icons.arrow_back_ios_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage("lib/assets/images/logo.png"),
              ),
            ),
            Divider(
              color: Colors.teal[400],
              height: 60.0,
            ),
            
Container(
    padding: EdgeInsets.all(10),
    child: Center(
        child: 
        
        Text(
          'Unwind with your family in the luxury of our tasteful accommodation. The offer includes a host of exciting summer deliverables! including a complimentary second room for children (up to 16 years) or parents (above 60 years) along with breakfast, sunset poolside snacks and digital photoshoot for family, unlimited Icecream / slushies, 20% discount on all hotel services with free Wi-Fi internet access. Some journeys can be summed up in a photo, a tweet, a souvenir. But others are so filled with inner riches, they defy easy description. For our guests, this has always posed a challenge: How to best capture the world of luxury that is The Leela? For one visitor, it’s a lobby – and a welcome that makes her feel like royalty. For another, it’s discovering a hidden garden, guided only by the scent of jasmine. To some, it is small touches that few others notice – the warmth of a gesture, the extra care in the simplest dish. Finding the right words for this distinctly Indian brand of luxury is made all the more difficult because it is constantly being refined and enhanced by each person we invite to join our staff'

 ,
 
          style: TextStyle(color: Colors.grey, fontSize: 22, height: 1.5),)
          
    )
)
          ],
            
        ),
      ),
    );
  }
}
