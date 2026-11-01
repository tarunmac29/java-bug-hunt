# Bug 02 – Summer (Off-by-One Error)

## Problem Description

The `Summer` class calculates the sum of all elements in an integer array.

However, the original implementation contains an incorrect loop condition that causes an `ArrayIndexOutOfBoundsException`.

## Original Buggy Code

```java
public int sum(int[] numbers) {
    int total = 0;
    for (int i = 0; i <= numbers.length; i++) {
        total += numbers[i];
    }
    return total;
}
```

## Root Cause

The loop condition uses:

```java
i <= numbers.length
```

Java array indexes start from `0`, so the last valid index is `numbers.length - 1`.

When `i` becomes equal to `numbers.length`, the program tries to access an invalid array index.

This results in an `ArrayIndexOutOfBoundsException`.

## Corrected Code

```java
public int sum(int[] numbers) {
    int total = 0;

    for (int i = 0; i < numbers.length; i++) {
        total += numbers[i];
    }

    return total;
}
```

## Test Cases

| Input | Expected Output |
|---|---:|
| `[1, 2, 3, 4]` | 10 |
| `[]` | 0 |

## How to Run Tests

```bash
mvn test -Dtest=SummerTest
```

## Key Learning

- Understand zero-based array indexing.
- Avoid off-by-one errors in loops.
- Use `i < array.length` for standard array traversal.
- An empty array produces a sum of `0`.

## Bug Status

Fixed and verified with the provided JUnit test cases.