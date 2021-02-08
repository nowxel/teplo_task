import 'package:teplo_task/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  int _sex;

  List<SexModel> _group = [
    SexModel(
      name: "Male",
      index: 1,
    ),
    SexModel(
      name: "Female",
      index: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: this._formKey,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomWidget(
                  data: _group,
                  onSaved: (value) => _sex = value,
                  validator: (value) {
                    if (value == null) {
                      return 'Set your sex';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    if (this._formKey.currentState.validate()) {
                      setState(() {
                        this._formKey.currentState.save();
                        print(_sex);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
