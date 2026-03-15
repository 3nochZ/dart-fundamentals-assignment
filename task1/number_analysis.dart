// task 1: number analysis app
// name: Henok Zemedkun

/// Finds the maximum value in a list of integers.
int findMax(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error: The list is empty. Returning 0 as maximum.');
    return 0;
  }

  int max = numbers[0];
  for (int number in numbers) {
    if (number > max) {
      max = number;
    }
  }
  return max;
}

/// Finds the minimum value in a list of integers.
int findMin(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error: The list is empty. Returning 0 as minimum.');
    return 0;
  }

  int min = numbers[0];
  for (int number in numbers) {
    if (number < min) {
      min = number;
    }
  }
  return min;
}

/// Calculates the sum of all integers in a list.
int calculateSum(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error: The list is empty. Returning sum 0.');
    return 0;
  }

  int sum = 0;
  for (int number in numbers) {
    sum += number;
  }
  return sum;
}

/// Calculates the average value of a list of integers.
double calculateAverage(List<int> numbers) {
  if (numbers.isEmpty) return 0.0;
  int sum = calculateSum(numbers);
  return sum / numbers.length;
}

/// Counts how many negative integers are in the list.
int countNegatives(List<int> numbers) {
  if (numbers.isEmpty) return 0;

  int count = 0;
  for (int number in numbers) {
    if (number < 0) {
      count++;
    }
  }
  return count;
}

/// Sorts a list of integers using the Bubble Sort algorithm.
List<int> sortNumbers(List<int> numbers) {
  List<int> sorted = List.from(numbers);

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

/* 
  Alternative implementations using Dart's built-in collection methods.
  These are generally more idiomatic and concise.
*/

int findMaxBuiltIn(List<int> numbers) =>
    numbers.isEmpty ? 0 : numbers.reduce((a, b) => a > b ? a : b);

int findMinBuiltIn(List<int> numbers) =>
    numbers.isEmpty ? 0 : numbers.reduce((a, b) => a < b ? a : b);

int calculateSumBuiltIn(List<int> numbers) =>
    numbers.fold(0, (sum, n) => sum + n);

double calculateAverageBuiltIn(List<int> numbers) =>
    numbers.isEmpty ? 0.0 : calculateSumBuiltIn(numbers) / numbers.length;

int countNegativesBuiltIn(List<int> numbers) =>
    numbers.where((n) => n < 0).length;

void main() {
  final List<int> numbers = [34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  final int max = findMax(numbers);
  final int min = findMin(numbers);
  final int sum = calculateSum(numbers);
  final double avg = calculateAverage(numbers);
  final int negativeCount = countNegatives(numbers);
  final List<int> sorted = sortNumbers(numbers);

  print('Number Analysis Results');
  print('========================');
  print('Numbers: $numbers');
  print('Sorted:  $sorted');
  print('Maximum Value : $max');
  print('Minimum Value : $min');
  print('Sum: $sum');
  print('Average: $avg');
  print('Negative Count: $negativeCount');
}
