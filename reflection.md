# Dart Fundamentals Reflection
**Developer:** Henok Zemedkun

---

## Part 1: Number Analysis

#### Q1. What is the difference between a List<int> and a List<dynamic> in Dart? Why is it usually better to use a typed list like List<int>?
**List<int>** is a typed list that can *only* store integers. In contrast, **List<dynamic>** can store any type of value (integers, strings, booleans, etc.). It is usually better to use a typed list because it prevents runtime type errors, makes the code more self-documenting, and allows the Dart compiler to optimize performance.

#### Q2. In your findMax() function, why is it important to initialize your 'running maximum' variable to the first element of the list rather than to 0 or to a very small number? What could go wrong with the other approaches?
Initializing with `numbers[0]` ensures the comparison starts with a legitimate value from the data set. If you initialized with a fixed number like `0`, and the list contained only negative numbers (e.g., `[-10, -5]`), the function would incorrectly return `0`, which wasn't even in the list. Starting with the first element guarantees the algorithm works regardless of the number range.

#### Q3. Your calculateAverage() function calls calculateSum() internally. What software design principle does this demonstrate, and why is reusing existing functions preferable to duplicating code?
This demonstrates the **DRY (Don't Repeat Yourself)** principle and **Code Reuse**. Reusing `calculateSum()` is preferable because it minimizes the surface area for bugs; if you need to fix a calculation error in the summation logic, you only update it in one place, and the average calculation automatically benefits.

#### Q4. Describe in plain English what the for-in loop syntax does in Dart. How is it different from a traditional for loop with an index? When would you prefer one over the other?
A **for-in loop** (e.g., `for (int n in numbers)`) automatically iterates through every element in a collection without needing an explicit counter. A **traditional for loop** uses an index variable (`int i`) to access elements by position. Use for-in for cleaner code when simply reading values; use a traditional loop when you need the index for logic (like swapping elements) or when modifying the list while iterating.

#### Q5. If someone calls your findMax() function with an empty list, what happens? How could you modify the function to handle that case safely?
Without a check, attempting to access `numbers[0]` on an empty list throws a `RangeError`. To handle this safely, we add an `if (numbers.isEmpty)` check at the start of the function to return a default value (like `0`) or log a descriptive error message, preventing the application from crashing.

---

## Part 2: Calculator app

#### Q6. What is the difference between a synchronous function and an asynchronous function in Dart? In your Calculator class, why is divide() synchronous while computeAsync() is asynchronous?
A **synchronous function** runs immediately and blocks the execution until it returns. An **asynchronous function** returns a `Future`, allowing other tasks to run while it waits. In the Calculator, `divide()` is synchronous because it performs a basic math operation that finishes instantly, while `computeAsync()` is asynchronous because it simulates a time-consuming network delay.

#### Q7. Explain the purpose of the await keyword in Dart. What happens if you forget to use await when calling an async function that returns a Future? What does your program print instead of the result?
The `await` keyword pauses execution within an `async` function until a `Future` completes. If you forget it, the program continues immediately and uses the `Future` object itself instead of the calculated value. Typically, your program would print `Instance of 'Future<double>'` instead of the numerical result.

#### Q8. What is the purpose of the try-catch block in your displayResult() method? What would happen if you removed it and then called displayResult(10, 0, 'divide')?
The `try-catch` block provides **Graceful Error Handling**. It intercepts exceptions (like division by zero) so the program can print a friendly error message and keep running. If removed, calling `divide` with zero would throw an unhandled `ArgumentError`, causing the program to crash and stop all subsequent calculations.

#### Q9. Why is it good design to have divide() throw an ArgumentError rather than simply returning 0 or printing an error inside the divide() method itself? What principle of function design does this reflect?
Throwing an `ArgumentError` is more precise because returning `0` might look like a valid calculation result, which is misleading. It follows the principle of **Separation of Concerns**: the function's job is to calculate, and it shouldn't worry about UI (printing). By throwing, it forces the caller to decide how to handle the failure contextually.

#### Q10. What does the async keyword on main() allow you to do? Could this assignment have been written without making main() async? Explain your answer.
The `async` keyword on `main()` allows the use of `await` to orchestrate asynchronous calls in order. While the assignment *could* be written without making `main()` async by using `.then()` callbacks, it would be much harder to read and manage the sequential flow of results, leading to "callback hell."

---

## Part 3: Critical Thinking

#### QR1. Which concept was hardest to understand: lists and loops, classes and methods, exception handling, or async/await? Walk through the specific moment of confusion and explain how you eventually understood it.
**Async/await** was the most challenging. My moment of confusion was understanding how the code could "await" a delay without freezing the entire application. I eventually understood it by visualizing a **Future** as a "receipt" for a value. The breakthrough was realizing the Dart event loop continues processing other tasks while waiting for that receipt to be fulfilled.

#### QR2. Look at your Task 1 solution. If you had to change your code to analyze a list of floating-point numbers (List<double>) instead of integers, how many places in your code would need to change? What does this tell you about the importance of thinking about data types during design?
In my Task 1 solution, I would need to change types in nearly **20 places** (every function signature and local variable). This highlights the importance of **Design for Change**. If I had used `num` or Generics (`List<T>`) initially, the code would be much more flexible. It shows that being overly specific with types early on can lead to rigid, hard-to-refactor code.

#### QR3. In Task 2, you simulated a network delay using Future.delayed(). Describe a real Flutter app feature where you would need to actually await a real asynchronous operation — not just a simulated delay. What would the Future resolve to, and what would happen to the UI while the user was waiting?
A real-world example is **Fetching a User's Profile** from a remote API. The `Future` would resolve to a `User` object or a JSON map. While the user waits, the UI should display a loading indicator (like a `CircularProgressIndicator`) to provide visual feedback that the app is actively loading data and hasn't frozen.

#### QR4. If a colleague asked you: 'Why not just use a single function that takes the operation name as a parameter, rather than writing separate add(), subtract(), multiply(), and divide() methods?' — what would you say? Are there advantages to both approaches?
I would say separate methods are better for **Type Safety**, clarity, and the **Single Responsibility Principle**. They make code easier to test and provide better IDE autocomplete. However, a single parameterized function is useful for **Dynamic Dispatch**—handling user-inputted operation names at runtime. The best approach is combining both: atomic methods for logic and a dispatcher/coordinator function for flexibility.
