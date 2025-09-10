void main() {
  BankAccount account = BankAccount(1000);
  account.deposit(10);
  account.withdraw(20);
  print('Balance: ${account.getBalance()}');
}

class BankAccount {
  double _balance;

  BankAccount(this._balance);

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: $amount');
    } else {
      print('Invalid deposit amount');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdrew: $amount');
    } else {
      print('Invalid withdraw amount or insufficient balance');
    }
  }

  double getBalance() {
    return _balance;
  }
}
