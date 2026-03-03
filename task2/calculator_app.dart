// Task 2: Async Calculator App
// Name: Yonathan Tatek
// ID: ATE/6955/15

import 'dart:async';

class DivisionByZeroException implements Exception {
  final String message;
  DivisionByZeroException([this.message = 'Cannot divide by zero']);
  @override
  String toString() => 'DivisionByZeroException: $message';
}

class Calculator {
  Future<double> add(double a, double b) async {
    await _simulateNetworkDelay();
    return a + b;
  }

  Future<double> subtract(double a, double b) async {
    await _simulateNetworkDelay();
    return a - b;
  }

  Future<double> multiply(double a, double b) async {
    await _simulateNetworkDelay();
    return a * b;
  }

  Future<double> divide(double a, double b) async {
    await _simulateNetworkDelay();
    if (b == 0) {
      throw DivisionByZeroException();
    }
    return a / b;
  }

  Future<void> _simulateNetworkDelay() async {
    print('[1.5 second pause]');
    // Simulate a network delay of 1.5 seconds
    await Future.delayed(Duration(milliseconds: 1500));
  }
}

void main() async {
  final calc = Calculator();

  print('--- MyCalculator ---');

  try {
    double res1 = await calc.add(10.0, 4.0);
    print('add(10.0, 4.0) = $res1');

    double res2 = await calc.subtract(10.0, 4.0);
    print('subtract(10.0, 4.0) = $res2');

    double res3 = await calc.multiply(10.0, 4.0);
    print('multiply(10.0, 4.0) = $res3');

    double res4 = await calc.divide(10.0, 4.0);
    print('divide(10.0, 4.0) = $res4');

    double res5 = await calc.divide(15.0, 3.0);
    print('divide(15.0, 3.0) = $res5');

    await calc.divide(10.0, 0.0);
  } on DivisionByZeroException catch (e) {
    print('Error: ${e.message}');
  } catch (e) {
    print('An unexpected error occurred: $e');
  } finally {
    print('All calculations complete.');
  }
}