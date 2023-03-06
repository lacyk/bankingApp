import 'dart:io';
import 'dart:async';
import 'dart:convert';
import './myLib.dart'; // importing logger();

main() async{
  final filename = 'test.csv';

// -------------------------------------------------- IN --------------------------------------------------
  List<Customer> people = readJSON(filename);
// ------------------------------------------------ ID getter ---------------------------------------------

  Set<int> idList = people.map((item) => item.id).toSet();
  int lastID = idList.reduce((a, b) => a > b ? a : b);
  print(lastID);

// -------------------------------------------------- OUT --------------------------------------------------
 writeJSON(filename, people);

// -------------------------------------------------- cannot make external function with this usage --------------------------------------------------


}

class Customer{
  String name;
  double amount;
  int id;
  int pass;

  Customer(this.name, this.amount, this.id, this.pass);

  Map<String, dynamic> toMap() {
    return {
      'name':   name,
      'amount': amount,
      'id':     id,
      'pass':   pass,
    };
  }

  static Customer fromMap(Map<String, dynamic> map) {
    return Customer(map['name'], map['amount'], map['id'], map['pass']);
  }

  @override
  String toString(){
    return "$name, $amount, $id";
  }

  void show(){
    print('Name: $name, Amount: $amount, ID: $id, password: $pass');
  }
}

dynamic lastID(db){
  Set<int> idList = db.map((item) => item.id).toSet();
  int lastID = idList.reduce((a, b) => a > b ? a : b);
  return lastID;
}


List<Customer> readJSON(filename){
  String jsonIN = File(filename).readAsStringSync();
  // List of strings
  List<dynamic> data = jsonDecode(jsonIN);

  // convert the list of maps to a list of objects
  List<Customer> people = data.map((map) => Customer.fromMap(map)).toList();

  return people;
}

void writeJSON(filename, people){
  final String jsonOUT = jsonEncode(
    people.map((person) => person.toMap()).toList(),
  );

  File(filename).writeAsStringSync(jsonOUT);
}