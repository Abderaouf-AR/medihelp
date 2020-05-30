import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:medihelp/kernel/Medicine.dart';
import 'package:medihelp/kernel/MedicineDatabase.dart';

class AddMedicinePage extends StatefulWidget {
  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              color: Color(0xff2e3192),
              height: 30.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height-30.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.grey, Colors.white, Colors.white,]
                  )
              ),
            ),
          ],
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff2e3192),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(40.0), bottomLeft: Radius.circular(40.0))
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 8,
                    child: Container(),
                  )
                ],
              ),
              ListView(
                children: <Widget>[
                  Container(
                      height:100,
                      width: 250,
                      child: Image.asset("images/logo_w.png")),
                  Card(
                    margin: EdgeInsets.all(10.0),
                    elevation: 15.0,
                    child:Container(
                      height: MediaQuery.of(context).size.height-215,
                      child: MedicineForm(),
                    ),
                  )
                ],
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0.0,
            notchMargin: 2.0,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff2e3192),
                  borderRadius: BorderRadius.only(topRight:  Radius.circular(30.0), topLeft: Radius.circular(30.0))
              ),
              height: 40.0,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Submit();
            },
            child: Icon(Icons.check),
            tooltip: "SOS - Order urgent Help -",
            backgroundColor: Colors.red,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ],
    );
  }

  TextEditingController nameCon = TextEditingController();
  TextEditingController qteCon = TextEditingController();
  var med_db = DatabaseHelperMedicine();

  String medname;
  int qte;
  DateTime startingDate=DateTime.now();
  TimeOfDay firstTime;
  TimeOfDay secondTime;
  TimeOfDay thirdTime;

  Widget MedicineForm(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Center(child: Text("Add a medecine form", style: TextStyle(fontSize: 30.0, color: Colors.red, fontWeight: FontWeight.bold),)),
          SizedBox(height: 10.0,),
          Text("Medecine name - - - - - - - ", style: TextStyle(fontSize: 25.0),),
          TextField(
            controller: nameCon,
            onChanged: (String value){
              medname = value;
            },
            decoration: InputDecoration(
                labelText: "Medecine name",
                hintText: "Enter here the full name of your medecine"
            ),
          ),
          SizedBox(height: 10.0,),
          Text("The quantity per day - - - - - - - ", style: TextStyle(fontSize: 25.0),),
          TextField(
            controller: qteCon,
            onChanged: (String value){
              qte = int.parse(value);
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                labelText: "The quantity per day",
                hintText: "Enter here will you take this medecine per day"
            ),
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text("Choose starting date"),
            onPressed: (){
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2025),
              ).then((DateTime value){
                if(value != null){
                  startingDate = value;
                }
              });
            },
          ),
          RaisedButton(
            color: Colors.lightBlueAccent,
            child: Text("Choose The first taking time"),
            onPressed: (){
              DateTime now = DateTime.now();
              showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: now.hour, minute: now.minute)
              ).then((TimeOfDay value){
                if(value != null){
                  firstTime = value;
                }
              });
            },
          ),
          RaisedButton(
            color: Colors.lightBlueAccent,
            child: Text("Choose The first taking time"),
            onPressed: (){
              DateTime now = DateTime.now();
              showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: now.hour, minute: now.minute)
              ).then((TimeOfDay value){
                if(value != null){
                  secondTime = value;
                }
              });
            },
          ),
          RaisedButton(
            color: Colors.lightBlueAccent,
            child: Text("Choose The first taking time"),
            onPressed: (){
              DateTime now = DateTime.now();
              showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: now.hour, minute: now.minute)
              ).then((TimeOfDay value){
                if(value != null){
                  thirdTime = value;
                }
              });
            },
          ),

        ],
      ),
    );
  }

  Submit(){
    if(medname != null && medname != "" && qte != null  && qte != 0 ){
      Medicine medicine = Medicine(medname, dateFormatted(startingDate), qte);
      med_db.saveMedicine(medicine);
      Navigator.of(context).pop();
    }
  }

  String dateFormatted(DateTime dateTime) {
    var formatter = new DateFormat("yyyy-MM-dd");
    String formatted = formatter.format(dateTime);
    return formatted;
  }
}
