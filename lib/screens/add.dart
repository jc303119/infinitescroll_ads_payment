import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:infinitescrolladspayment/db/dboperations.dart';
import 'package:infinitescrolladspayment/screens/list.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  DbOperation _db = DbOperation.getInstance();
  int counter = 1001;
  String appId = "ca-app-pub-8793483933690205~3222290134";
  initState(){
    Admob.initialize(appId);
  }
  _addNewEmp(){
    _db.addEmp(counter, 'Zakir', (counter.toDouble() + 1000));
    counter++;
  }
  viewEmpList(){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ListScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Emp'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Add'),
              onPressed: (){
                _addNewEmp();
              },
            ),
            RaisedButton(
              child: Text('View'),
              onPressed: (){
                viewEmpList();
              },
            )
          ],
        ),
      ),
    );
  }
}
