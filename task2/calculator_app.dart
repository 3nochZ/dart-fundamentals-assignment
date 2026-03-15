// task 2: async calculator app
// name: Henok Zemedkun

import 'dart:async';

class Calculator {
  final String name;

  // Global constant for simulated network delay
  static const Duration serverDelay = Duration(seconds: 1, milliseconds: 500);

  // history log
  final List<String> history = [];

  Calculator(this.name);

  /// Adds two numbers
  double add(double a, double b) => a + b;

  /// Subtracts b from a
  double subtract(double a, double b) => a - b;

  /// Multiplies two numbers
  double multiply(double a, double b) => a * b;

  /// Divides a by b. Throws ArgumentError if b is zero.
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    return a / b;
  }

  /// Performs an operation asynchronously with a simulated network delay.
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

    // wait for simulated network response
    await Future.delayed(serverDelay);

    return result;
  }

  /// Computes and prints the result of an operation, logging it to history.
  Future<void> displayResult(double a, double b, String op) async {
    try {
      final double result = await computeAsync(a, b, op);
      final String record = '$op($a, $b) = $result';
      print(record);
      history.add(record);
    } catch (e) {
      print('Operation Error: $e');
    }
  }

  /// Prints the entire session's calculation history.
  void printHistory() {
    print('\nCalculation History:');
    for (String item in history) {
      print('- $item');
    }
  }

  /// Sequentially applies an operation to a list of values.
  Future<double> computeChained(List<double> values, String op) async {
    if (values.isEmpty) return 0.0;

    double result = values[0];
    for (int i = 1; i < values.length; i++) {
      result = await computeAsync(result, values[i], op);
    }

    final String record = 'Chained $op$values = $result';
    print(record);
    history.add(record);
    return result;
  }
}

Future<void> main() async {
  final Calculator calc = Calculator('MyCalculator');
  final Stopwatch stopwatch = Stopwatch();

  print('--- ${calc.name} ---');

  // Sequential execution test
  print('\nStarting Sequential Execution...');
  stopwatch.start();
  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(10, 4, 'subtract');
  await calc.displayResult(10, 4, 'multiply');
  stopwatch.stop();
  final int sequentialTime = stopwatch.elapsedMilliseconds;
  print('Sequential time total: ${sequentialTime}ms');

  stopwatch.reset();

  // Parallel execution test using Future.wait
  print('\nStarting Parallel Execution...');
  stopwatch.start();
  /*
    Why parallel is faster:
    In sequential mode, each 'await' pauses the script, meaning the total 
    delay equals the sum of all individual delays. 
    In parallel mode (Future.wait), all futures are launched at once, 
    so the total wait time is just the duration of the longest single delay.
  */
  await Future.wait([
    calc.displayResult(10, 4, 'divide'),
    calc.displayResult(15, 3, 'divide'),
    calc.displayResult(10, 0, 'divide'), // test error handling
  ]);
  stopwatch.stop();
  final int parallelTime = stopwatch.elapsedMilliseconds;
  print('Parallel time total: ${parallelTime}ms');

  print('\nTesting Chained Operations:');
  await calc.computeChained([1, 2, 3, 4], 'add');
  await calc.computeChained([100, 20, 10], 'subtract');

  calc.printHistory();

  print('\nAll operations completed.');
}