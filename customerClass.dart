class Customer{
  String name;
  double amount;
  int id;
  int pass;

  Customer(this.name, this.amount, this.id, this.pass);

  // I/O Methods
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
  //
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

  @override
  String toString(){
    return "$name, $amount, $id";
  }

  void show(){
    print('Name: $name, Amount: $amount, ID: $id, password: $pass');
  }
}
