// parent Class : User
// Holds details about an user
// Has a function to show user details
//
// Child Class : Bank
// Stores details about the account balance
// Stores details about the amount
// Allows for deposits, withdraw, view balance


void main() {
  User bob = User("Bobby Fisher", 32);
  bob.display();
  bob.name = "Bob";
  bob.display();
}

class User {
  String name;
  int age;

  User(this.name, this.age);

  void display() {
    print("User name: $name, User age: $age");
  }
}