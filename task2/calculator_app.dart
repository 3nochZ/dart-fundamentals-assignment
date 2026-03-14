// task 1: number analysis app
// name: Henok Zemedkun

int findMax(List<int> numbers) {
	int max = numbers[0];

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

// test
void main() {
	final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

	int max = findMax(numbers);
	int min = findMin(numbers);
	int sum = calculateSum(numbers);

	print('Number Analysis Results');
	print('========================');
	print('numbers: $numbers');
	print('Maximum Value : $max');
	print('Minimum Value : $min');
	print('Sum: $sum');
}


