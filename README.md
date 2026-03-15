# Dart Fundamentals Assignment
**Developer:** Henok Zemedkun

This repository contains two primary tasks focused on Dart programming fundamentals, including collection manipulation, object-oriented design, error handling, and asynchronous programming.

---

## Tasks Overview

### Task 1: Number Analysis App
A functional implementation of a number analysis tool that processes `List<int>` data.
- **Core Operations**: Find Maximum, Minimum, Sum, Average, and Count Negatives.
- **Algorithm**: Manual implementation of Bubble Sort.
- **Best Practices**: Includes both manual loop implementations and modern Dart built-in collection methods (`reduce`, `fold`, `where`).

### Task 2: Async Calculator App
An asynchronous calculator that simulates real-world server delays while performing mathematical operations.
- **Features**:
  - Sequential and Parallel execution modes (using `Future.wait`).
  - Chained operations across numerical lists.
  - History logging of all successful calculations.
  - Robust error handling for edge cases such as division by zero and unknown operations.
- **Performance**: Parallel execution demonstrates a significant performance boost (~1.5s vs ~4.5s for 3 operations) by running tasks concurrently.

---

## Reflections
Found in [reflection.md](./reflection.md), this document covers:
- Comparison between typed (`List<int>`) and untyped (`List<dynamic>`) collections.
- Principles of function design (DRY, Single Responsibility).
- The transition from Synchronous to Asynchronous programming in Dart.
- Critical analysis of coding patterns and refactoring costs.

---

## How to Run
Ensure you have the [Dart SDK](https://dart.dev/get-dart) installed.

```bash
# Run Task 1 (Number Analysis)
dart task1/number_analysis.dart

# Run Task 2 (Async Calculator)
dart task2/calculator_app.dart
```
