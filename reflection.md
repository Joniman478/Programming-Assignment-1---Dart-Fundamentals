# Reflection on Dart Fundamentals Assignment
**Name:** Yonathan Tatek  
**ID:** ATE/6955/15 

## Implementation Reflection

### Task 1 — Number Analysis App
Through Task 1, I explored the use of loops and conditionals in Dart. Understanding how to efficiently iterate through lists to find sum, average, minimum, or maximum values is vital for data manipulation.

**Key Learnings:**
- Using `for-in` loops for concise iterations.
- Implementing edge-case handling for empty lists.

### Task 2 — Async Calculator App
Task 2 challenged me to implement OOP principles while also managing asynchronous operations and exceptions. Building a custom exception for division by zero was important for robust application design.

**Key Learnings:**
- Asynchronous programming using `Future`, `async`, and `await`.
- Handling specific exceptions with `try-catch` blocks.
- Simple OOP architecture for class methods.

---

## Critical Reflection Questions

**QR1. Which concept was hardest to understand: lists and loops, classes and methods, exception handling, or async/await? Walk through the specific moment of confusion and explain how you eventually understood it.**

Async/await was definitely the most challenging concept. My specific moment of confusion occurred when I first implemented `Future.delayed()`. I expected the entire program to stop (freeze) for 1.5 seconds, but I noticed that other code could still run if not awaited. I eventually understood it by visualizing the **Dart Event Loop**. I realized that `await` doesn't "stop the world"; it just tells the current function to yield control back to the event loop until the "Future" is ready. Seeing `Future.wait` run three tasks in the same time it took for one (1.5s instead of 4.5s) was the "aha!" moment that solidified my understanding of concurrency.

**QR2. Look at your Task 1 solution. If you had to change your code to analyze a list of floating-point numbers (`List<double>`) instead of integers, how many places in your code would need to change? What does this tell you about the importance of thinking about data types during design?**

In my current implementation, I would need to change approximately **15 to 20 places**. This includes every function parameter type (`List<int>` to `List<double>`), return types for sums and maximums, and local variable declarations within loops. This exercise highlights the critical importance of **Generics** in software design. If I had used a generic type (like `T extends num`) or at least the broader `num` class from the start, the code would be much more resilient to changes in data requirements. It taught me that rigid typing, while safe, can lead to significant refactoring work if the initial requirements are too narrow.

**QR3. In Task 2, you simulated a network delay using `Future.delayed()`. Describe a real Flutter app feature where you would need to actually await a real asynchronous operation — not just a simulated delay. What would the Future resolve to, and what would happen to the UI while the user was waiting?**

A real-world example would be **fetching a user's order history** from a REST API in a shopping app. The `Future` would resolve to a `List<Order>` object (mapped from JSON). While the user is waiting for the network request to travel to the server and back, the UI should display a **loading indicator** (like a `CircularProgressIndicator`) or **skeleton loaders**. This prevents the user from interacting with empty lists and provides visual feedback that the app is actively working, which is essential for a good User Experience (UX).

**QR4. If a colleague asked you: 'Why not just use a single function that takes the operation name as a parameter, rather than writing separate `add()`, `subtract()`, `multiply()`, and divide() methods?' — what would you say? Are there advantages to both approaches?**

I would explain that both have their place but serve different architectural goals:
- **Separate Methods (`add()`, `subtract()`):** These offer better **type safety** and **IDE support**. If I use `calc.add(5, 5)`, the compiler ensures I'm calling a valid method. It follows the **Single Responsibility Principle** and makes unit testing much more granular.
- **Single Parameter Function (`computeAsync(op)`):** This is ideal for **dynamic routing**. For example, if the operation comes from a user's selection in a dropdown menu, passing a string parameter is much cleaner than a massive `if-else` block in the UI code.
- **Conclusion:** My Task 2 actually uses both! I have specific logic for division (to handle the zero-case uniquely) but wrap it in a `computeAsync` dispatcher to allow for the flexible, parallel execution demonstrated in the `main()` function.

---

## Personal Growth
Working on these tasks has solidified my understanding of Dart's type system and modern features. One of the main challenges was ensuring all potential errors (like empty lists or division by zero) were appropriately addressed before they could crash the application.