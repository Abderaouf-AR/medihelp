import 'package:flutter/material.dart';
import 'package:medihelp/kernel/Measurement.dart';
import 'package:medihelp/kernel/MeasurementsDatabase.dart';

class DiagnostiPage extends StatefulWidget {
  @override
  _DiagnostiPageState createState() => _DiagnostiPageState();
}

class _DiagnostiPageState extends State<DiagnostiPage> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      getMeasurementlist();
    });
    return Scaffold(
      backgroundColor: Color(0xff2e3192),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff2e3192),
        title: Text("My Diagnostics", style: TextStyle(fontSize: 35.0),),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
        ),
        child: Column(
          children: <Widget>[
            FlatButton(
                color: Colors.red,
                onPressed: (){
                  setState(() {

                  });
                },
                child: Text("Show")),
            Container(
                height: 300.0,
                child: MeasurementList()),
          ],
        ),
      ),
    );
  }

  var measurement_db = new DatabaseHelperMeasurement();
  List<Map<String, dynamic>> measurementList = <Map<String, dynamic>>[];

  getMeasurementlist() async{
    measurementList = await  measurement_db.getAllMeasurements();
  }

  Widget MeasurementList(){
    return ListView.builder(
      itemCount: measurementList.length,
      itemBuilder: (_, int position){
        return  ListTile(
          title: Text("ID: ${Measurement.fromMap(measurementList[position]).id}",style: TextStyle(fontSize: 30.0),),
          subtitle: Text("${Measurement.fromMap(measurementList[position]).date}",style: TextStyle(fontSize: 20.0),),
          trailing: Text("${Measurement.fromMap(measurementList[position]).value} g", style: TextStyle(fontSize: 30.0, color: Colors.green, fontWeight: FontWeight.bold),),
        );
      },
    );
  }

}
