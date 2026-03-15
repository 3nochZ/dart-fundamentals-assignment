// task 2: async calculator app
// name: Henok Zemedkun

import 'dart:async';

class Calculator {
  final String name;

  // history log
  final List<String> history = [];

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


  // async calculator with delay
  Future<double> computeAsync(double a, double b, String op) async {
    double result;

    switch (op) {
      case 'add':
        result = add(a, b);
        break;

      case 'subtract':
        result = subtract(a, b);
        break;

      case 'multiply':
        result = multiply(a, b);
        break;

      case 'divide':
        result = divide(a, b);
        break;

      default:
        throw ArgumentError('Unknown operation: $op');
    }

    // simulate server delay
    await Future.delayed(Duration(seconds: 1, milliseconds: 500));

    return result;
  }

  Future<void> displayResult(double a, double b, String op) async {
    try {
      final result = await computeAsync(a, b, op);
      final record = '$op($a, $b) = $result';
      print(record);
      history.add(record); // save to history
    } catch (e) {
      print('Error: $e');
    }
  }

  // print all past calculations
  void printHistory() {
    print('\ncalculation history:');
    for (var item in history) {
      print(item);
    }
  }
}

Future<void> main() async {
  final calc = Calculator('MyCalculator');

  print('--- ${calc.name} ---');

  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(10, 4, 'subtract');
  await calc.displayResult(10, 4, 'multiply');
  await calc.displayResult(10, 4, 'divide');
  await calc.displayResult(15, 3, 'divide');
  await calc.displayResult(10, 0, 'divide'); // test error

   // print stored history
  calc.printHistory();

  print('All calculations complete.');
}