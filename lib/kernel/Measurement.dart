

class Measurement {

  int id;
  String value;
  String date;



  Measurement(this.value, this.date);

  Measurement.map(dynamic obj){
    this.id = obj["id"];
    this.value = obj["value"];
    this.date =obj["date"];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(id != null){
      map["id"] = id;
    }
    map["value"] = value;
    map["date"] = date;

    return map;
  }

  Measurement.fromMap(Map<String, dynamic> obj){
    this.id = obj["id"];
    this.value = obj["value"];
    this.date =obj["date"];
  }

}

