import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Bill(),
));

class Bill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('You have selected'),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage(
                                "lib/assets/images/logo.png",
                              ),
                  ),
                ),
                Divider(
                  color: Colors.grey[800],
                  height: 60.0,
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
                    'Cost Per Night',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    'Rs. 12,000 Only',
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
                    'Maximum Occupancy',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    '4 Adults',
                    style: TextStyle(
                      color: Colors.teal[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(height: 200.0),
                
              ],
            ),
          ),
          Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 65.0,
                            height: 65.0,
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(12.0)),
                            alignment: Alignment.center,
                            child: Image(
                              image:
                                  AssetImage("lib/assets/images/tab_saved.png"),
                              height: 22.0,
                              color: Colors.black,
                            )),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                              height: 65.0,
                              margin: EdgeInsets.only(
                                left: 16.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.teal[400],
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
        ],
        
      ),
      
      //  floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.push(context,
      //               new MaterialPageRoute(builder: (context) => new Login()));
      //     },
      //     child: const Icon(
      //       Icons.home_filled,
      //     ),
      //     backgroundColor: Colors.teal[400],
      //   )
    );
  }
}