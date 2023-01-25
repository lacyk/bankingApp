import 'dart:io';
import 'package:args/args.dart';

class User {
  String name;
  int age;
  User(this.name, this.age);

  void display(){
    print("User name: $name, age: $age");
  }
}

class BankAccount extends User {
  BankAccount(super.name, super.age);

  double _balance = 0;
  double get balance => _balance;

  deposit(double amount) {
    _balance += amount;
  }

  bool withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      return true;
    }
    return false;
  }

  showBalance(){
    print("Your balance: $balance");
  }
}

void main() {
  var account = BankAccount("Bob", 43);

  account.deposit(114415.54);
  print(account.balance);

  account.display();
  account.showBalance();
  account.withdraw(4415.54);
  account.showBalance();
}
