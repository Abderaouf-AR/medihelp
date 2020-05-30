


class Medicine{
  int id;
  String name;
  String startDate;
  int qtePerDay;
  String firstTime="";
  String secondTime="";
  String thirdTime="";



  Medicine(this.name, this.startDate, this.qtePerDay);

  Medicine.map(dynamic obj){
    this.id = obj["id"];
    this.name = obj["name"];
    this.startDate =obj["startDate"];
    this.qtePerDay =obj["qtePerDay"];
    this.firstTime =obj["firstTime"];
    this.secondTime =obj["secondTime"];
    this.thirdTime =obj["thirdTime"];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(id != null){
      map["id"] = id;
    }
    map["name"] = name;
    map["startDate"] = startDate;
    map["qtePerDay"] = qtePerDay;
    map["firstTime"] = firstTime;
    map["secondTime"] = secondTime;
    map["thirdTime"] = thirdTime;

    return map;
  }

  Medicine.fromMap(Map<String, dynamic> obj){
    this.id = obj["id"];
    this.name = obj["name"];
    this.startDate =obj["startDate"];
    this.qtePerDay =obj["qtePerDay"];
    this.firstTime =obj["firstTime"];
    this.secondTime =obj["secondTime"];
    this.thirdTime =obj["thirdTime"];
  }
}