// Task 1: Number Analysis
// Name: Yonathan Tatek
// ID: ATE/6955/15

void main() {
  List<int> numbers = [12, -5, 8, 21, -14, 7, 30, 2, -19];
  List<int> emptyList = [];

  print(''' 
            Number Analysis (with Challenges)
        ========================================
  ''');

  print('Input List: $numbers');

  // Standard and Functional Analysis
  print('Sum (Loop): ${calculateSum(numbers)}');
  print('Sum (Functional): ${calculateSumFunctional(numbers)}');

  print('Average (Loop): ${calculateAverage(numbers).toStringAsFixed(2)}');
  print(
    'Average (Functional): ${calculateAverageFunctional(numbers).toStringAsFixed(2)}',
  );

  print('Maximum (Loop): ${findMax(numbers)}');
  print('Maximum (Functional): ${findMaxFunctional(numbers)}');

  print('Minimum (Loop): ${findMin(numbers)}');
  print('Minimum (Functional): ${findMinFunctional(numbers)}');

  print('Even Numbers (Loop): ${filterEven(numbers)}');
  print('Even Numbers (Functional): ${filterEvenFunctional(numbers)}');

  print('Negative Count (Loop): ${countNegatives(numbers)}');
  print('Negative Count (Functional): ${countNegativesFunctional(numbers)}');

  print('Sorted List (Bubble Sort): ${bubbleSort(numbers)}');

  print('\n--- Empty List Guard Test ---');
  print('Max of empty list: ${findMax(emptyList)}');
}

/* 
  TRADEOFFS: LOOP vs COLLECTION METHODS
  - Loop versions: Generally easier to debug, allows more complex logic control (break/continue), 
    and is often slightly more performant for massive datasets in Dart.
  - Collection Methods: More concise, expressive, and declarative. Reduces boilerplate code 
    and follows modern functional programming patterns.
*/

// --- SUM ---
int calculateSum(List<int> list) {
  if (list.isEmpty) return 0;
  int sum = 0;
  for (int num in list) {
    sum += num;
  }
  return sum;
}

int calculateSumFunctional(List<int> list) {
  return list.fold(0, (sum, element) => sum + element);
}

// --- AVERAGE ---
double calculateAverage(List<int> list) {
  if (list.isEmpty) {
    print('Warning: Cannot calculate average of empty list.');
    return 0.0;
  }
  return calculateSum(list) / list.length;
}

double calculateAverageFunctional(List<int> list) {
  if (list.isEmpty) return 0.0;
  return list.fold(0, (s, e) => s + e) / list.length;
}

// --- MAX ---
int findMax(List<int> list) {
  if (list.isEmpty) {
    print('Error: Empty list provided to findMax.');
    return 0; // Sensible default
  }
  int max = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] > max) max = list[i];
  }
  return max;
}

int findMaxFunctional(List<int> list) =>
    list.isEmpty ? 0 : list.reduce((curr, next) => curr > next ? curr : next);

// --- MIN ---
int findMin(List<int> list) {
  if (list.isEmpty) {
    print('Error: Empty list provided to findMin.');
    return 0;
  }
  int min = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] < min) min = list[i];
  }
  return min;
}

int findMinFunctional(List<int> list) =>
    list.isEmpty ? 0 : list.reduce((curr, next) => curr < next ? curr : next);

// --- EVENS ---
List<int> filterEven(List<int> list) {
  List<int> evens = [];
  for (int num in list) {
    if (num % 2 == 0) evens.add(num);
  }
  return evens;
}

List<int> filterEvenFunctional(List<int> list) =>
    list.where((n) => n % 2 == 0).toList();

// --- NEGATIVES ---
int countNegatives(List<int> list) {
  int count = 0;
  for (int num in list) {
    if (num < 0) count++;
  }
  return count;
}

int countNegativesFunctional(List<int> list) => list.where((n) => n < 0).length;

// --- SORTING ---
List<int> bubbleSort(List<int> list) {
  if (list.isEmpty) return [];
  List<int> sorted = List.from(list); // Don't modify original
  for (int i = 0; i < sorted.length - 1; i++) {
    for (int j = 0; j < sorted.length - i - 1; j++) {
      if (sorted[j] > sorted[j + 1]) {
        int temp = sorted[j];
        sorted[j] = sorted[j + 1];
        sorted[j + 1] = temp;
      }
    }
  }
  return sorted;
}