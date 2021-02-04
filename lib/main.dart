import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

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

class Overview extends StatelessWidget {
  Overview({Key key}) : super (key: key);

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter FormBuilder'),),
      body: FormBuilder(
          key: _fbKey,
          child: Column(
            children: <Widget>[
              FormBuilderFilterChip(
                // name: 'filter_chip',
                decoration: InputDecoration(
                  labelText: 'Select many options',
                ),
                options: [
                  FormBuilderFieldOption(
                      value: 'Man', child: Text('Man')),
                  FormBuilderFieldOption(
                      value: 'Woman', child: Text('Woman')),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      _fbKey.currentState.reset();
                    })
              ],)
            ],
          )),
    );
  }
}


