import 'dart:io';
import 'package:args/args.dart';
import 'package:test/scaffolding.dart';
// checkout to new branch
class User {
  String name;
  int age;
  // int pass;
  User(this.name, this.age);
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
    } else {
      print("You don't have enough money to withdraw");
      return false;
    }
  }

  showBalance(){
    print("Your balance: $balance \n");
  }
}


void main() {
  var bob = BankAccount("Bob", 43);

  Parser(bob);
  // var a = userKey();
  // print("User-Login is: $a");
}

void Menu() {
  print(
      "Choose the option below: \n"
      "1. Create account \n"
      "2. Deposit money on your bank account\n"
      "3. Withdraw money from your bank account\n"
      "4. Money transfer\n"
      "5. Show balance\n"
      "6. Exit \n"
  );
}

String Function() userKey = (){
  print("Enter your name: \n");
  String input = stdin.readLineSync()!;
  return input;
};

Parser(obj){
  Menu();
    // while loop for continuous running switch
    while (true) {
      int input = int.parse(stdin.readLineSync()!);
      switch (input) {
        case 1:
          {
            print("number $input");
          }
          break;
        case 2:
          {
            print("Type the amount of money to deposit: \n");
            double input = double.parse(stdin.readLineSync()!);
            obj.deposit(input);
            obj.showBalance();
          }
          continue menu;
        case 3:
          {
            print("Type the amount of money to withdraw: \n");
            double input = double.parse(stdin.readLineSync()!);
            obj.withdraw(input);
            obj.showBalance();
          }
          continue menu;
        case 4:
          {
            print("number $input");
          }
          break;
        case 5:
          {
            obj.showBalance();
          }
          continue menu;

        case 6: {
          return input;
        }

        menu: case 7:
        {
          Menu();
        }
        break;
        default:
        {
          print("Something went wrong, try choosing the option again: \n");
        }
        continue menu;
      }
      // if user choose option 6 —> exit
      if (input == 6){
        break;
      }
    }
}