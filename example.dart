import 'dart:io';
import 'dart:async';
import 'dart:convert';
import './myLib.dart'; // importing logger();
import 'customerClass.dart';

main() async{
  final filename = 'test.csv';

// -------------------------------------------------- IN --------------------------------------------------
  List<Customer> people = readJSON(filename);
// ------------------------------------------------ ID getter ---------------------------------------------

  Set<int> idList = people.map((item) => item.id).toSet();
  int lastID = idList.reduce((a, b) => a > b ? a : b);
  print(lastID);

  bool isLogged = logger(people);
  print(isLogged);

// -------------------------------------------------- OUT --------------------------------------------------
 writeJSON(filename, people);

// -------------------------------------------------- cannot make external function with this usage --------------------------------------------------



}


int lastID(db){
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