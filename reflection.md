Q1. What is the difference between a List<int> and a List<dynamic> in Dart? Why is it usually better to use a typed list like List<int>?

List<int> is a typed list. So, it can only store integers.

But, List<dynamic> can store any type of value( integers, strings, booleans, or objects.)

Using List<int> is usually better because it prevents type errors, the code is clearer and easier to understand, and it improves safety.


Q2. In your findMax() function, why is it important to initialize your 'running maximum' variable to the first element of the list rather than to 0 or to a very small number? What could go wrong with the other approaches?

We initialize the running maximum with numbers[0] so the comparison starts with a real value from the list.

If we start with 0, problems can occur. For example, if all numbers are negative:

And, if max starts at 0, the function would return 0, even though 0 is not in the list.

Using the first element guarantees it works correctly for both positive and negative numbers.


Q3. Your calculateAverage() function calls calculateSum() internally. What software design principle does this demonstrate, and why is reusing existing functions preferable to duplicating code?

This demonstrates code reuse and modularity.

Instead of rewriting the logic to add numbers again, the program reuses the existing function.

It helps avoid duplicate code and makes the program easier to maintain. And, if the sum logic changes, you only update one place

This idea is called DRY (Don't Repeat Yourself).


Q4. Describe in plain English what the for-in loop syntax does in Dart. How is it different from a traditional for loop with an index? When would you prefer one over the other?

A for-in loop goes through every element in a collection automatically.

Example:

dart
for (int n in numbers) {
  print(n);
}

This means:
“Take each value in numbers one at a time and store it in n.”

A traditional for loop uses an index:

dart
for (int i = 0; i < numbers.length; i++) {
  print(numbers[i]);
}


Differences:

| for-in loop              | traditional for loop        |
| ------------------------ | --------------------------- |
| simpler syntax           | uses index variable         |
| directly accesses values | accesses values using index |

We should use for-in when you just need to read each element.
We should use a traditional for loop when you need the index or position.

Q5. If someone calls your findMax() function with an empty list, what happens? How could you modify the function to handle that case safely?

If an empty list is passed, the code tries to access numbers[0].
Since the list has no elements, Dart throws a runtime error (RangeError).

We can prevent this by checking if the list is empty first. This makes the function safer because it detects invalid input before processing it.
