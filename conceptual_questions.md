# 1.6 Conceptual Questions

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