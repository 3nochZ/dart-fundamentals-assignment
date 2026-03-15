# Dart Fundamentals Refection
**Developer:** Henok Zemedkun

---

## Part 1: Number Analysis

#### Q1. What is the difference between a List<int> and a List<dynamic> in Dart? Why is it usually better to use a typed list like List<int>?
**List<int>** is a typed list that can *only* store integers. In contrast, **List<dynamic>** can store any type of value (integers, strings, booleans, etc.). It is usually better to use a typed list because it prevents runtime type errors, makes the code more self-documenting, and allows the Dart compiler to optimize performance.

#### Q2. In your findMax() function, why is it important to initialize your 'running maximum' variable to the first element of the list?
Initializing with `numbers[0]` ensures the comparison starts with a legitimate value from the data set. If you initialized with `0`, and the list contained only negative numbers (e.g., `[-10, -5]`), the function would incorrectly return `0`, which wasn't even in the list.

#### Q3. Your calculateAverage() function calls calculateSum() internally. What design principle does this demonstrate?
This demonstrates the **DRY (Don't Repeat Yourself)** principle and **Code Reuse**. By reusing `calculateSum()`, the code is easier to maintain; if the summation logic ever needs updating, you only have to change it in one location.

#### Q4. Describe the for-in loop syntax in Dart. How is it different from a traditional for loop?
A **for-in loop** (e.g., `for (int n in numbers)`) automatically iterates through every element in a collection without needing an explicit index. A **traditional for loop** uses an index variable (`int i`) to access elements by position. Use for-in for simplicity when reading values; use a traditional loop when you need to know the index or modify the list structure while iterating.

#### Q5. If someone calls your findMax() function with an empty list, what happens?
Without a check, attempting to access `numbers[0]` on an empty list throws a `RangeError`. To handle this safely, we add an `if (numbers.isEmpty)` check to return a default value or print a descriptive error message before the crash occurs.

---

## Part 2: Calculator app

#### Q6. What is the difference between a synchronous and an asynchronous function in Dart?
A **synchronous function** runs immediately and blocks the program until it returns a result. An **asynchronous function** (marked with `async`) returns a `Future`. It allows the program to continue other work while waiting for a time-consuming task (like a network request) to complete.

#### Q7. Explain the purpose of the await keyword in Dart.
The `await` keyword pauses the execution of an `async` function until the `Future` completes. If you forget to use it, the function returns the `Future` object itself (a "box" containing the eventual result) rather than the actual value, often leading to "Instance of 'Future<double>'" being printed.

#### Q8. What is the purpose of the try-catch block in your displayResult() method?
It provides **Graceful Error Handling**. If an operation (like division by zero) throws an exception, the `catch` block intercepts it, allowing the program to print a user-friendly error message and continue with subsequent calculations instead of crashing the entire application.

#### Q9. Why throw an ArgumentError rather than returning 0 in divide()?
Throwing an error is more honest. Returning `0` could be misinterpreted as a valid result of a calculation. Signalling an error forces the caller to acknowledge that the input was invalid, following the principle of **Separation of Concerns**.

#### Q10. What does the async keyword on main() allow you to do?
It enables the use of `await` inside the `main` function. This is critical for our assignment because it allows us to wait for the 1.5-second "server responses" before moving to the next calculation, ensuring the output appears in a logical, sequential order.

---

## Part 3: Critical Thinking

#### QR1. Which concept was hardest to understand?
**Async/await** was the most challenging. The confusion stemmed from how code could "await" a delay without freezing the entire application. I understood it by visualizing a **Future** as a "receipt" for a value. The breakthrough was realizing the Dart event loop handles other things while waiting for that receipt to be fulfilled.

#### QR2. If you had to change your code to List<double>, how many places would change?
In my Task 1 solution, I would need to change types in nearly **20 places** (function signatures, local variable declarations, and instantiations). This highlight the importance of **Generics** or broader types like `num`. Being too specific early on makes refactoring significantly more expensive.

#### QR3. Describe a real Flutter app feature that requires a real await.
**Fetching a User Profile** via an HTTP GET request to a REST API. The `Future` would resolve to a `User` object. While waiting, the UI should display a `CircularProgressIndicator` to provide visual feedback that data is being retrieved.

#### QR4. Advantages of separate methods vs. a single parameterized function?
Separate methods (`add`, `subtract`) provide **Type Safety** and better **IDE Autocomplete**. A single function with a parameter (a "dispatcher") is better for **Dynamic Dispatch**—when the user picks an operation at runtime. A balanced design uses separate methods for logic and a dispatcher for flexibility.
