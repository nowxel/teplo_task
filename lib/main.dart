import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Overview(),
    );
  }
}

class Overview extends StatefulWidget {

  Overview({Key key}) : super (key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  int selectedRadio;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter FormBuilder'),),
      body: FormBuilder(
          key: _fbKey,
          child: Column(
            children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: Colors.green,
                    onChanged: (val){
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    activeColor: Colors.green,
                    onChanged: (val){
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (!_fbKey.currentState.validate()) {
                        return;
                      }
                      _fbKey.currentState.save();

                      print(_fbKey);
                    })
              ],)
            ],
          )),
    );
  }
}


