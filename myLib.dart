import 'dart:io';

// retrieve user's ID and asking for password
logger(db) {
  print("What is your ID?");
  int id = int.parse(stdin.readLineSync()!);
  int index = db.indexWhere((item) => item.id == id);

  for (int i = 0; i < 3; i++) {
    if (index != -1) {
      print("Type the password for user with ID $id:");
      int pass = int.parse(stdin.readLineSync()!);

      if (pass == db[index].pass) {
        print("Login Successful");
        return true;
      } else if (i == 2) {
        print("Invalid Password, try again.");
        return false;
      } else {
        print('Invalid Password, (${2 - i} attempts left)');
      }
    }
  }
}

// void main(){
//   logger();
// }