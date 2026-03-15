// task 2: async calculator app
// name: Henok Zemedkun

import 'dart:async';

class Calculator {
  final String name;

  Calculator(this.name);

  double add(double a, double b) => a + b;

  double subtract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    return a / b;
  }
}