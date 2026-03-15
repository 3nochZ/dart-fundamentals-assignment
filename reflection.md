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

Q6. What is the difference between a synchronous function and an asynchronous function in Dart? In your Calculator class, why is divide() synchronous while computeAsync() is asynchronous?

A synchronous function runs immediately and returns a result right away. The program waits until the function finishes before continuing.

An asynchronous function may take time to finish (for example, waiting for a network request or database query). Instead of returning the result immediately, it returns a Future that will contain the result later.

Q7. Explain the purpose of the await keyword in Dart. What happens if you forget to use await when calling an async function that returns a Future? What does your program print instead of the result?
 
The await keyword tells Dart to pause execution of the current async function until the Future finishes and returns its result. If we forget to use await, the function will return a Future object instead of the actual value.
 
 
Q8. What is the purpose of the try-catch block in your displayResult() method? What would happen if you removed it and then called displayResult(10, 0, 'divide')?
 
The try-catch block is used to safely handle errors that might occur during the calculation. In our case, it catches the error thrown when dividing by zero.

If the try-catch block is removed and the program runs:

displayResult(10, 0, 'divide')

the divide() method throws an ArgumentError, and the program will crash instead of continuing. The error message would appear and the remaining calculations would not run.

Using try-catch allows the program to handle errors gracefully and print a friendly message instead of stopping execution.

Q9. Why is it good design to have divide() throw an ArgumentError rather than simply returning 0 or printing an error inside the divide() method itself? What principle of function design does this reflect?

Throwing an ArgumentError is better design because it clearly signals that the input values are invalid.

If the function returned 0, it could be misleading because 0 might look like a valid result.
If it printed an error inside the function, the caller would have less control over how to handle the error.

By throwing an error, the caller decides how to handle the problem, the function remains focused on performing its task, and errors are handled in a consistent way

This reflects the principle of separation of concerns and good function design, where functions report problems rather than hiding them. 

Q10. What does the async keyword on main() allow you to do? Could this assignment have been written without making main() async? Explain your answer.
 
The async keyword allows the main() function to use the await keyword inside it.

This is important because main() calls displayResult(), which is an asynchronous function that returns a Future. By using await, main() waits for each result before continuing to the next operation.

Without async, main() could not use await. The program would still run, but all the asynchronous calls might start at the same time and the output could appear out of order.

Making main() async ensures the operations run one after another and the results appear with the intended 1.5-second delay between each calculation.


QR1. Which concept was hardest to understand: lists and loops, classes and methods, exception handling, or async/await? Walk through the specific moment of confusion and explain how you eventually understood it.

Async/await was the most challenging concept. The specific moment of confusion was understanding how the code could "await" a delay without freezing the entire application. Initially, it felt like the program would just stop. I eventually understood it by visualizing the "Future" as a placeholder or a receipt for a value that hasn't arrived yet. Realizing that the Dart event loop continues to process other tasks while waiting for that "receipt" to be fulfilled was the key breakthrough.


QR2. Look at your Task 1 solution. If you had to change your code to analyze a list of floating-point numbers (List<double>) instead of integers, how many places in your code would need to change? What does this tell you about the importance of thinking about data types during design?

In my Task 1 solution, I would need to change types in nearly 20 places: every function signature (parameter and return types), local variable declarations (like `max`, `min`, `sum`), and the list instantiation itself. This highlights the importance of "Design for Change." If I had used `List<num>` or Generics (`List<T>`), the code would have been much more flexible. It shows that being too specific with types early on can lead to rigid code that is hard to refactor.


QR3. In Task 2, you simulated a network delay using Future.delayed(). Describe a real Flutter app feature where you would need to actually await a real asynchronous operation — not just a simulated delay. What would the Future resolve to, and what would happen to the UI while the user was waiting?

A real-world example is fetching a user's profile information from a remote database via an HTTP GET request. The Future would resolve to a `User` object (or a JSON string that needs parsing). While the user is waiting, the UI should display a loading state, such as a Shimmer effect or a `CircularProgressIndicator`. This prevents the user from seeing a blank screen and provides immediate feedback that the app is working on their request.


QR4. If a colleague asked you: 'Why not just use a single function that takes the operation name as a parameter, rather than writing separate add(), subtract(), multiply(), and divide() methods?' — what would you say? Are there advantages to both approaches?

I would say that separate methods are better for clarity, type safety, and the "Single Responsibility Principle." They make the code easier to test and provide better IDE autocomplete. However, a single function with a parameter (like my `computeAsync` switch block) is useful for "Dynamic Dispatch"—when the operation is determined at runtime by user input. The best approach is often a combination: separate methods for core logic, and a central dispatcher for dynamic execution.


 


