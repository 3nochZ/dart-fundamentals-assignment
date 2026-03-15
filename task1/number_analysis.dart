// task 1: number analysis app
// name: Henok Zemedkun

int findMax(List<int> numbers) {
	//add empty checker
	if (numbers.isEmpty) {
    print('error: list is empty');
    return 0;
	}

	int max = numbers[0];

	for (int i in numbers) {
		if (i > max){
			max = i;
		}
	}
	return max;
}

int findMin(List<int> numbers) {
	//add empty checker
	if (numbers.isEmpty) {
    print('error: list is empty');
    return 0;
	}

	int min = numbers[0];

	for (int n in numbers) {
	if (n < min) {
		min = n; 
		}
	}

	return min;
}

int calculateSum(List<int> numbers) {
	//add empty checker
	if (numbers.isEmpty) {
    print('error: list is empty');
    return 0;
	}

	int sum = 0; 

	for (int n in numbers) {
	sum += n;
	}

	return sum;
}

double calculateAverage(List<int> numbers) {
  int sum = calculateSum(numbers); 
  return sum / numbers.length;
}

int countNegatives(List<int> numbers) {
	//add empty checker
	if (numbers.isEmpty) {
    print('error: list is empty');
    return 0;
	}

	int count = 0;

	for (int n in numbers) {
	if (n < 0) {
		count++;
		}
	}

	return count;
}

// bubble sort
List<int> sortNumbers(List<int> numbers) {
  List<int> sorted = List.from(numbers); // copy list

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
using dart collection methods
*/

int findMaxBuiltIn(List<int> numbers) =>
    numbers.isEmpty ? 0 : numbers.reduce((a, b) => a > b ? a : b);

int findMinBuiltIn(List<int> numbers) =>
    numbers.isEmpty ? 0 : numbers.reduce((a, b) => a < b ? a : b);

int calculateSumBuiltIn(List<int> numbers) =>
    numbers.fold(0, (sum, n) => sum + n);

double calculateAverageBuiltIn(List<int> numbers) =>
    numbers.isEmpty ? 0 : numbers.fold(0, (sum, n) => sum + n) / numbers.length;

int countNegativesBuiltIn(List<int> numbers) =>
    numbers.where((n) => n < 0).length;

/*
trade-offs

manual loops:
- better for learning
- shows how logic works

built-in methods:
- shorter and cleaner
- usually more efficient
*/

// test
void main() {
	final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

	int max = findMax(numbers);
	int min = findMin(numbers);
	int sum = calculateSum(numbers);
	double avg = calculateAverage(numbers);
	int negativeCount = countNegatives(numbers);

	print('Number Analysis Results');
	print('========================');
	print('numbers: $numbers');
	print('Maximum Value : $max');
	print('Minimum Value : $min');
	print('Sum: $sum');
	print('Average: $avg');
	print('Negative Count: $negativeCount');
}


