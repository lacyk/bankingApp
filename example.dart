// parent Class : User
// Holds details about an user
// Has a function to show user details
//
// Child Class : Bank
// Stores details about the account balance
// Stores details about the amount
// Allows for deposits, withdraw, view balance


void main() {
  User bob = User("Bob", 320.19);
  User tod = User("Tod", 1234.98);
  tod.display();
  bob.display();
  bob.buy(30);
  print(tod.funds);
}

class User {
  String name;
  double funds;

  User(this.name, this.funds);

  void display() {
    print("User name: $name, User funds: $funds");
  }

  buy(sum){
    if (this.funds >= sum){
      print("User $name have enough funds (>$sum) to complete the purchase.");
    }
  }
}