import 'package:flutter/material.dart';
import 'package:hmsepm/pages/LSOptions.dart';
import 'package:hmsepm/pages/bill.dart';

void main() => runApp(new FormScreen());

class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Bookings',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new MyHomePage(title: 'Book Your Room in 9 simple steps'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: new AppBar(
          backgroundColor: Colors.teal[400],
          title: new Text(widget.title),
        ),
        body: Stepper(
          steps: _mySteps(),
          currentStep: this._currentStep,
          onStepTapped: (step) {
            setState(() {
              this._currentStep = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (this._currentStep < this._mySteps().length - 1) {
                this._currentStep = this._currentStep + 1;
              } else {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Bill()));
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (this._currentStep > 0) {
                this._currentStep = this._currentStep - 1;
              } else {
                this._currentStep = 0;
              }
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Icon(
            Icons.arrow_right,
          ),
          backgroundColor: Colors.teal[400],
        ));
  }

  String dropdownValue = 'One';
  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text('Your Name'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Middle Name (If any)'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'First Name'),
            )
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('E-mail ID'),
        content: TextField(),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Phone Number'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Primary Number'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Alternate Phone number'),
            )
          ],
        ),
        isActive: _currentStep >= 2,
      ),
      Step(
        title: Text('Current Address'),
        content: TextField(),
        isActive: _currentStep >= 3,
      ),
      Step(
        title: Text('Any personal ID number'),
        content: TextField(),
        isActive: _currentStep >= 4,
      ),
      Step(
        title: Text('Date of Arrival'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'DD'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'MM'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'YY'),
            )
          ],
        ),
        isActive: _currentStep >= 5,
      ),
      Step(
        title: Text('Date of Departure'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'DD'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'MM'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'YY'),
            )
          ],
        ),
        isActive: _currentStep >= 6,
      ),
      Step(
        title: Text('Mode of transport'),
        content: TextField(),
        isActive: _currentStep >= 7,
      ),
      Step(
        title: Text('Room Configuration'),
        content: Column(children: <Widget>[
          DropdownButton<String>(
            items: [],
            value: dropdownValue,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });

              items:
              <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList();
            },
          )
        ]),
        isActive: _currentStep >= 8,
      ),
    ];
    return _steps;
  }
}
