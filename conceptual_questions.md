# Conceptual Questions

**Q1. What is the difference between a `List<int>` and a `List<dynamic>` in Dart? Why is it usually better to use a typed list like `List<int>`?**

A `List<int>` is a type-safe collection that is strictly restricted to storing integer values, whereas a `List<dynamic>` can store elements of any type, including mixtures of strings, numbers, and objects. It is generally better to use a typed list like `List<int>` because it provides compile-time type safety, preventing accidental insertion of incorrect data types. Additionally, typed lists allow the Dart compiler to optimize memory usage and execution speed, while significantly improving code readability and maintainability for other developers.

**Q2. In your `findMax()` function, why is it important to initialize your 'running maximum' variable to the first element of the list rather than to 0 or to a very small number? What could go wrong with the other approaches?**

Initializing the 'running maximum' to the first element of the list ensures that the initial comparison value is actually part of the dataset. If you were to initialize it to 0 and the list consisted entirely of negative numbers, the function would incorrectly return 0 as the maximum, even though it isn't in the list. Using a "very small number" is also risky because it relies on assumptions about the input range; by using the first element, you guarantee the function works correctly for any range of numbers, including all-negative or uniquely scaled datasets.

**Q3. Your `calculateAverage()` function calls `calculateSum()` internally. What software design principle does this demonstrate, and why is reusing existing functions preferable to duplicating code?**

This demonstrates the **DRY (Don't Repeat Yourself)** principle and the concept of **modularization**. Reusing existing functions is preferable to duplicating code because it simplifies maintenance; if the logic for calculating a sum needs to be updated (for example, to add validation or logging), you only have to modify it in one location. Beyond maintenance, it reduces the likelihood of bugs caused by inconsistent logic across different parts of the application and makes the code more readable by using descriptive, high-level function calls.

**Q4. Describe in plain English what the for-in loop syntax does in Dart. How is it different from a traditional for loop with an index? When would you prefer one over the other?**

In plain English, a `for-in` loop tells Dart to "look at every item in this collection one by one and do something with it." It differs from a traditional `for` loop because it abstracts away the management of an index variable (like `i`), focusing purely on the values themselves. You would prefer a `for-in` loop when you simply need to iterate through all elements for processing, as it is cleaner and less prone to "off-by-one" errors. However, a traditional index-based `for` loop is preferable when you specifically need the item's position, such as when you need to access multiple lists by the same index or when you need to skip specific intervals.

**Q5. If someone calls your `findMax()` function with an empty list, what happens? How could you modify the function to handle that case safely?**

In the current implementation of `findMax()`, calling it with an empty list causes the program to throw an explicit `Exception('List is empty')`, which would crash the application if not caught in a try-catch block. To handle this more safely and gracefully, you could modify the function to return a nullable integer (`int?`), returning `null` when the list is empty. This would shift the responsibility to the caller to handle the absence of a value using null-safety features rather than dealing with a runtime crash.

**Q6. What is the difference between a synchronous function and an asynchronous function in Dart? In your Calculator class, why is `divide()` synchronous while `computeAsync()` is asynchronous?**

In Dart, a **synchronous function** executes its operations immediately and blocks the program’s execution until it finishes, whereas an **asynchronous function** returns a `Future` and allows the program to perform other tasks while it waits for a result. In our Calculator class, `divide()` is synchronous because it performs a simple arithmetic operation that is processed instantly by the CPU without any delay. In contrast, `computeAsync()` is asynchronous because it is designed to handle tasks that take time—such as a network request or a simulated delay—ensuring that the application remains responsive while waiting for the result.

**Q7. Explain the purpose of the `await` keyword in Dart. What happens if you forget to use `await` when calling an async function that returns a Future? What does your program print instead of the result?**

The **`await` keyword** is used within an asynchronous function to pause execution until a requested `Future` completes, allowing the code to retrieve the actual value held by that Future. If you forget to use `await`, the program will not wait for the asynchronous operation to finish; it will immediately move to the next line of code. Instead of the expected numeric result, the program will print something like `Instance of 'Future<double>'`, as it is attempting to display the container (the Future object) rather than the value inside it.

**Q8. What is the purpose of the try-catch block in your `displayResult()` method? What would happen if you removed it and then called `displayResult(10, 0, 'divide')`?**

The **`try-catch` block** in the `displayResult()` method is used to gracefully manage errors, preventing the application from crashing when an unexpected event occurs. It "tries" to execute the calculation and "catches" any exceptions—such as a division by zero error—to display a user-friendly message instead. If the `try-catch` block were removed and a division by zero occurred, the program would terminate abruptly with an "unhandled exception" error, stopping all further calculations and potentially causing a poor user experience.

**Q9. Why is it good design to have `divide()` throw an `ArgumentError` rather than simply returning 0 or printing an error inside the `divide()` method itself? What principle of function design does this reflect?**

Throwing an **`ArgumentError`** is superior design because it clearly signals that an invalid operation was attempted, whereas returning 0 could be mistaken for a valid result. Printing an error inside the function is also discouraged because it forces a specific way of handling the error (logging to the console), which limits the flexibility of the caller. This approach reflects the **Separation of Concerns** and **Fail-Fast** principles; it ensures that the mathematical logic is kept separate from the error-reporting logic and that bugs are identified as soon as they occur.

**Q10. What does the `async` keyword on `main()` allow you to do? Could this assignment have been written without making `main()` async? Explain your answer.**

The **`async` keyword on `main()`** allows the use of the `await` keyword within the main function's body, enabling us to handle asynchronous operations sequentially and readably. While this assignment *could* technically have been written without making `main()` asynchronous—by using the `.then()` syntax to handle Future results via callbacks—it would result in significantly more complex and harder-to-read code. Using `async/await` is the modern standard for writing clean, maintainable asynchronous code in Dart.