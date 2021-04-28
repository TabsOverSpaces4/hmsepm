import 'package:flutter/material.dart';
import 'package:hmsepm/pages/LSOptions.dart';

void main() => runApp(MaterialApp(
  home: Bill(),
));

class Bill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Thankyou For Choosing Us'),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage(
                            "lib/assets/images/logo.png",
                          ),
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 60.0,
            ),
            Center(
              child: Text(
                'NAME',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Harsh Gupta',
                style: TextStyle(
                  color: Colors.teal[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                'Your Stay',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                '5-3-21 to 8-3-21',
                style: TextStyle(
                  color: Colors.teal[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                'Room Configuration',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Founders Edition Suite',
                style: TextStyle(
                  color: Colors.teal[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                'Total Cost',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Rs. 28,000 Only',
                style: TextStyle(
                  color: Colors.teal[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                'Booking ID',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'RRO001',
                style: TextStyle(
                  color: Colors.teal[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 200.0),
            Center(
              child: Center(
                child: Row(
                  children: <Widget>[
                    Center(
                      child: Icon(
                        Icons.email,
                        color: Colors.grey[400],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Center(
                      child: Text(
                        'helpwithhotel@sepm.com',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 18.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Login()));
          },
          child: const Icon(
            Icons.home_filled,
          ),
          backgroundColor: Colors.teal[400],
        )
    );
  }
}