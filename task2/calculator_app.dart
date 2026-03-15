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

  // chain operations sequentially
  Future<double> computeChained(List<double> values, String op) async {
    if (values.isEmpty) return 0.0;
    
    double result = values[0];
    for (var i = 1; i < values.length; i++) {
      result = await computeAsync(result, values[i], op);
    }
    
    final record = 'Chained $op$values = $result';
    print(record);
    history.add(record);
    return result;
  }
}

Future<void> main() async {
  final calc = Calculator('MyCalculator');

  final stopwatch = Stopwatch();

  print('--- ${calc.name} ---');

  // 1. Sequential Execution
  print('\nStarting Sequential Execution...');
  stopwatch.start();
  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(10, 4, 'subtract');
  await calc.displayResult(10, 4, 'multiply');
  stopwatch.stop();
  final sequentialTime = stopwatch.elapsedMilliseconds;
  print('Sequential time: ${sequentialTime}ms');

  stopwatch.reset();

  // 2. Parallel Execution (using Future.wait)
  print('\nStarting Parallel Execution...');
  stopwatch.start();
  /*
    Why parallel is faster:
    In sequential execution, each 'await' pauses the program until the operation (and its delay) completes 
    before starting the next one. Total time = sum of all delays.
    
    In parallel execution (Future.wait), we start all operations simultaneously. 
    They all run concurrently, so the total time is limited by the longest single delay 
    rather than the sum of all delays.
  */
  await Future.wait([
    calc.displayResult(10, 4, 'divide'),
    calc.displayResult(15, 3, 'divide'),
    calc.displayResult(10, 0, 'divide'), // test error
  ]);
  stopwatch.stop();
  final parallelTime = stopwatch.elapsedMilliseconds;
  print('Parallel time: ${parallelTime}ms');

  print('\nTesting Chained Operations:');
  await calc.computeChained([1, 2, 3, 4], 'add');
  await calc.computeChained([100, 20, 10], 'subtract');

   // print stored history
  calc.printHistory();

  print('All calculations complete.');
}