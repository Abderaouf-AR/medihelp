import 'package:flutter/material.dart';
import 'package:medihelp/kernel/Medicine.dart';
import 'package:medihelp/kernel/MedicineDatabase.dart';

class Medicineslistpage extends StatefulWidget {
  @override
  _MedicineslistpageState createState() => _MedicineslistpageState();
}

class _MedicineslistpageState extends State<Medicineslistpage> {
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

  var med_db = new DatabaseHelperMedicine();
  List<Map<String, dynamic>> medecinesList = <Map<String, dynamic>>[];

  getMeasurementlist() async{
    medecinesList = await  med_db.getAllMeasurements();
  }

  Widget MeasurementList(){
    return ListView.builder(
      itemCount: medecinesList.length,
      itemBuilder: (_, int position){
        return  ListTile(
          title: Text("${Medicine.fromMap(medecinesList[position]).name}",style: TextStyle(fontSize: 30.0),),
          subtitle: Text(" Starting date: ${Medicine.fromMap(medecinesList[position]).startDate}",style: TextStyle(fontSize: 18.0),),
          trailing: Text("${Medicine.fromMap(medecinesList[position]).qtePerDay} per day", style: TextStyle(fontSize: 30.0, color: Colors.green, fontWeight: FontWeight.bold),),
        );
      },
    );
  }
}
