import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:call_number/call_number.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final TextEditingController _controller = new TextEditingController();

  @override
  initState() {
    super.initState();
  }

  _initCall() async {
    if(_controller.text != null)
      await new CallNumber().callNumber('+91' + _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Column(
          children: 
            <Widget>[
              new TextField(
                controller: _controller,
                keyboardType: TextInputType.phone,
                decoration: new InputDecoration(
                  hintText: 'Enter the Number',
                ),
              ),
              new IconButton(onPressed: _initCall, icon: new Icon(Icons.call)),
            ]
        ),
      ),
    );
  }
}
