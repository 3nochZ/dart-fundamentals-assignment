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

// test
void main() {
  final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  int max = findMax(numbers);

  print('numbers: $numbers');
  print('maximum value : $max');
}
