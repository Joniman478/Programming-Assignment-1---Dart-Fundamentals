// Task 2: Async Calculator App
// Name: Yonathan Tatek
// ID: ATE/6955/15

class Calculator {
  // Synchronous divide method as required by the conceptual questions
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    return a / b;
  }

  // Asynchronous computeAsync method as required by the conceptual questions
  Future<double> computeAsync(double a, double b, String operation) async {
    await _simulateNetworkDelay();
    switch (operation) {
      case 'add':
        return a + b;
      case 'subtract':
        return a - b;
      case 'multiply':
        return a * b;
      case 'divide':
        return divide(a, b);
      default:
        throw ArgumentError('Invalid operation');
    }
  }

  // Simulated internal delay with the specific message provided
  Future<void> _simulateNetworkDelay() async {
    print('[1.5 second pause]');
    await Future.delayed(Duration(milliseconds: 1500));
  }
}

// Method to display results and handle exceptions using try-catch as required
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
  } catch (e) {
    print('Error: $e');
  }
}

void main() async {
  final calc = Calculator();

  print(' --- MyCalculator --- ');

  // Sequential execution to match the exact output trace requested
  await displayResult(20.0, 4.0, 'add', calc);
  await displayResult(20.0, 4.0, 'subtract', calc);
  await displayResult(20.0, 4.0, 'multiply', calc);
  await displayResult(20.0, 4.0, 'divide', calc);
  await displayResult(25.0, 3.0, 'divide', calc);
  await displayResult(20.0, 0.0, 'divide', calc);

  print('All calculations complete.');
}
