// task 1: number analysis app
// name: Henok Zemedkun

int findMax(List<int> numbers) {
	int max = numbers[0];

	//add empty checker
	if (numbers.isEmpty) {
    print('error: list is empty');
    return 0; // default value
  }

	for (int i in numbers) {
		if (i > max){
			max = i;
		}
	}
	return max;
}

int findMin(List<int> numbers) {
  int min = numbers[0];

  for (int n in numbers) {
    if (n < min) {
      min = n; 
    }
  }

  return min;
}

int calculateSum(List<int> numbers) {
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

// test
void main() {
	final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

	int max = findMax(numbers);
	int min = findMin(numbers);
	int sum = calculateSum(numbers);
	double avg = calculateAverage(numbers);

	print('Number Analysis Results');
	print('========================');
	print('numbers: $numbers');
	print('Maximum Value : $max');
	print('Minimum Value : $min');
	print('Sum: $sum');
	print('Average: $avg');
}


