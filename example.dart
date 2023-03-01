import 'dart:io';
import 'dart:async';
import 'dart:convert';
import './myLib.dart'; // importing logger();

main() async{
  List<Customer> db = opener("./db.csv");
  db.add(Customer("Legit", 1235.23, 5, 5555));
  print(db);
  final filename = 'test.csv';

  // encode the list of objects as a JSON string
  String json = jsonEncode(
    db.map((person) => person.toMap()).toList(),
  );

  // write the JSON string to a file
  // File(filename).writeAsStringSync(json);

  ////////

  // read the JSON string from the file
  String jsonIN = File(filename).readAsStringSync();

  // decode the JSON string into a list of maps
  List<dynamic> data = jsonDecode(jsonIN);

  // convert the list of maps to a list of objects
  List<Customer> people = data.map((map) => Customer.fromMap(map)).toList();

  // print the list of objects
  print(people);
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

int lastID(db){
  Set<int> idList = db.map((item) => item.id).toSet();
  int lastID = idList.reduce((a, b) => a > b ? a : b);
  return lastID;
}


opener(path){
  File file = File(path);
  //whole content
  String content = file.readAsStringSync();
  // splitted content by new_line character
  List<String> splitted = content.split("\n");
  List<Customer> customers = [];
  Set<int> idCollection = {};


  for (String text in splitted){
    String name = text.split(',')[0];
    double amount = double.parse(text.split(',')[1]);
    int id = int.parse(text.split(',')[2]);
    int pass = int.parse(text.split(',')[3]);

    customers.add(Customer(name, amount, id, pass));
  }

  return customers;
}