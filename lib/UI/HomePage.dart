import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medihelp/UI/AddMedicinePage.dart';
import 'package:medihelp/UI/DiagnostiPage.dart';
import 'package:medihelp/UI/Medicineslistpage.dart';
import 'package:medihelp/kernel/Measurement.dart';
import 'package:medihelp/kernel/MeasurementsDatabase.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          body: SafeArea(
            child: Stack(
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
                    Center(
                      child: Container(
                          height:100,
                          width: 250,
                          child: Image.asset("images/logo_w.png")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap:(){
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext c){
                                          return Medicineslistpage();
                                        }
                                    )
                                );
                              },
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 45.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage("images/drugs.png"),
                                ),
                              ),
                            ),
                            Text("My Medicines", style: TextStyle(fontSize: 18.0, color: Color(0xff2e3192),),),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap:(){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext c){
                                      return DiagnostiPage();
                                    }
                                  )
                                );
                              },
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 45.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage("images/diagno.png"),
                                ),
                              ),
                            ),
                            Text("My Diagnostics", style: TextStyle(fontSize: 18.0, color: Color(0xff2e3192),),),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 45.0,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage("images/doctor.png"),
                              ),
                            ),
                            Text("Ask a Doctor", style: TextStyle(fontSize: 18.0, color: Color(0xff2e3192),),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 75,
                      width: MediaQuery.of(context).size.width-26.0,
                      child: Card(
                        elevation: 15.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              onPressed: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext c){
                                          return AddMedicinePage();
                                        }
                                    )
                                );
                              },
                              child: Text("       Add a\n medicament", style: TextStyle( fontSize: 22.0),),
                            ),
                            Container(height: 45,width: 1.0,color: Colors.black45,),
                            FlatButton(
                              onPressed: (){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: new Text("Add  a easurement"),
                                        content: ListView(
                                          children: <Widget>[
                                            Image.asset("images/add_measure.png"),
                                            TextField(
                                              keyboardType: TextInputType.number,
                                              onChanged: (String val){
                                                newMeasure = val;
                                              },
                                              decoration: InputDecoration(
                                                hintText: "enter here the new measurement"
                                              ),
                                            )
                                          ],
                                        ),
                                        actions: <Widget>[
                                          new FlatButton(
                                            child: new Text("Cancel"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          new FlatButton(
                                            child: new Text("Add"),
                                            onPressed: () {
                                              if(newMeasure != null && newMeasure != ""){
                                                Measurement measurement = Measurement(newMeasure, dateFormatted());
                                                measurement_db.saveMeasurement(measurement);
                                                Navigator.of(context).pop();
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Text("        Add a\n measurement", style: TextStyle(color: Color(0xff29abe2), fontSize: 22.0, fontWeight: FontWeight.bold ),),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height-450,
                      width: MediaQuery.of(context).size.width-26,
                      child: Card(
                        elevation: 15.0,
                        child: Column(
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Time to the next measurement", style: TextStyle(color: Color(0xff29abe2), fontSize: 22.0, fontWeight: FontWeight.bold ),),
                                    SizedBox(height: 5.0,),
                                    Container(
                                      width: MediaQuery.of(context).size.width-60,
                                      decoration:BoxDecoration(
                                        border:  Border.all(color: Color(0xff29abe2), width: 3.0),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("   1 hour 22 min", style: TextStyle(color: Colors.red,fontSize: 22.0, fontWeight: FontWeight.bold ),),
                                          Container(
                                            height: 50.0,
                                            width: 150.0,
                                            decoration:BoxDecoration(
                                              border:  Border.all(color: Color(0xff29abe2), width: 3.0),
                                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                              color: Color(0xff29abe2),
                                            ),
                                            child: Center(child: Text("Last 0.95g", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white ),)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("The next time to take a medicine", style: TextStyle(color: Color(0xff2e3192), fontSize: 22.0, fontWeight: FontWeight.bold ),),
                                    SizedBox(height: 5.0,),
                                    Container(
                                      width: MediaQuery.of(context).size.width-60,
                                      decoration:BoxDecoration(
                                        border:  Border.all(color: Color(0xff2e3192), width: 3.0),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("   2 hour 13 min", style: TextStyle(color: Colors.red,fontSize: 22.0, fontWeight: FontWeight.bold ),),
                                          Container(
                                            height: 50.0,
                                            width: 150.0,
                                            decoration:BoxDecoration(
                                              border:  Border.all(color: Color(0xff2e3192), width: 3.0),
                                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                              color: Color(0xff2e3192),
                                            ),
                                            child: Center(child: Text("Antag 20mg", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white ),)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
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
            child: Icon(Icons.local_hospital),
            tooltip: "SOS - Order urgent Help -",
            backgroundColor: Colors.red,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ],
    );
  }

  String newMeasure;
  var measurement_db = new DatabaseHelperMeasurement();

  String dateFormatted() {
    var now = DateTime.now();
    var formatter = new DateFormat("yyyy-MM-dd hh:mm:ss");
    String formatted = formatter.format(now);
    return formatted;
  }
}
