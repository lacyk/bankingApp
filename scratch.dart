import 'dart:convert';
import 'dart:io';
import 'myLib.dart';

void main(){
  BankUsr bob = BankUsr("Bob", 999.98, 1, 1111);
  List<BankUsr> db = openFile();
  print(db.indexWhere((element) => element.id == 3));

  logger(db);

}

class BankUsr {
  String name;
  int pass;
  double amount;
  int id;

  BankUsr(this.name, this.amount, this.id, this.pass);

  @override
  String toString(){
    return "$name, $amount, $id, $pass";
  }
}

openFile(){
  String content = File("./db.csv").readAsStringSync();
  List<String> splitted = content.split("\n");
  List<BankUsr> users = [];

  for (dynamic text in splitted){
    int id = int.parse(text.split(",")[2]);
    int pass = int.parse(text.split(',')[3]);
    String name = (text.split(",")[0]);
    double amount = double.parse(text.split(",")[1]);

    users.add(BankUsr(name, amount, id, pass));
  }
  return users;
}
