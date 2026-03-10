// Task 2: Async Calculator App (Advanced Version)
// Name: Yonathan Tatek
// ID: ATE/6955/15

import 'dart:async';

// Extension 3: Custom Exception for Input Validation
class UnrecognizedOperationException implements Exception {
  final String operation;
  UnrecognizedOperationException(this.operation);

  @override
  String toString() =>
      'UnrecognizedOperationException: "$operation" is not a valid operation.';
}

class Calculator {
  // Extension 1: History Log
  final List<String> _history = [];

  // Synchronous divide method
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    return a / b;
  }

  // Asynchronous computeAsync method with Extension 1 (History) and 3 (Validation)
  Future<double> computeAsync(double a, double b, String operation) async {
    await _simulateNetworkDelay();
    double result;

    switch (operation) {
      case 'add':
        result = a + b;
        break;
      case 'subtract':
        result = a - b;
        break;
      case 'multiply':
        result = a * b;
        break;
      case 'divide':
        result = divide(a, b);
        break;
      default:
        throw UnrecognizedOperationException(operation);
    }

    // Record every completed calculation
    _history.add('$operation($a, $b) = $result');
    return result;
  }

  // Extension 2: Chain Operations (sequentially applied)
  Future<double> computeChained(List<double> values, String op) async {
    if (values.isEmpty) return 0.0;
    double current = values[0];
    for (int i = 1; i < values.length; i++) {
      current = await computeAsync(current, values[i], op);
    }
    return current;
  }

  // Extension 1: Print History
  void printHistory() {
    print('\n--- Calculation History ---');
    if (_history.isEmpty) {
      print('No calculations recorded.');
    } else {
      for (var record in _history) print(record);
    }
  }

  // Simulated internal delay
  Future<void> _simulateNetworkDelay() async {
    print('[1.5 second pause]');
    await Future.delayed(Duration(milliseconds: 1500));
  }
}

// Method updated to handle Extension 3 exception
Future<void> displayResult(
  double a,
  double b,
  String operation,
  Calculator calc,
) async {
  try {
    double result = await calc.computeAsync(a, b, operation);
    print('$operation($a, $b) = $result');
  } on ArgumentError catch (e) {
    print('Error: ${e.message}');
  } on UnrecognizedOperationException catch (e) {
    print(e);
  } catch (e) {
    print('Unexpected Error: $e');
  }
}

void main() async {
  final calc = Calculator();

  print(' --- MyCalculator (Advanced) --- ');

  // 1. STANDARD OPERATIONS (Sequential)
  await displayResult(10.0, 4.0, 'add', calc);
  await displayResult(15.0, 3.0, 'divide', calc);
  await displayResult(10.0, 0.0, 'divide', calc);

  // 2. EXTENSION: CHAIN OPERATIONS
  print('\n--- Testing Chained Addition ([1, 2, 3, 4]) ---');
  double result = await calc.computeChained([1.0, 2.0, 3.0, 4.0], 'add');
  print('Chained Result: $result');

  // 3. EXTENSION: INPUT VALIDATION
  print('\n--- Testing Invalid Operation ---');
  await displayResult(10, 5, 'modulo', calc);

  // 4. EXTENSION: PARALLEL FUTURES (Future.wait)
  print('\n--- Testing Parallel Execution (3 Tasks) ---');
  Stopwatch stopwatch = Stopwatch()..start();

  /* 
    WHY PARALLEL IS FASTER:
    In sequential execution, the code waits for each 1.5s delay to finish before starting the next.
    In contrast, Future.wait() triggers all asynchronous operations at once. 
    The Dart event loop manages them as they wait for their timers concurrently, 
    meaning the total duration is roughly that of the longest single delay (1.5s) 
    instead of the cumulative sum (4.5s).
  */
  await Future.wait([
    displayResult(5, 5, 'add', calc),
    displayResult(20, 10, 'subtract', calc),
    displayResult(4, 4, 'multiply', calc),
  ]);

  stopwatch.stop();
  print(
    'Total time for 3 parallel operations: ${stopwatch.elapsed.inMilliseconds}ms',
  );

  // 5. EXTENSION: HISTORY LOG
  calc.printHistory();

  print('\nAll operations complete.');
}
