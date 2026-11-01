# Bug 02 – Summer (Off-by-One Error)

## Problem

The original loop condition was:

```java
i <= numbers.length
```

This causes an `ArrayIndexOutOfBoundsException` because the last valid array index is `numbers.length - 1`.

## Root Cause

The loop attempts to access an index equal to the array length, which is outside the valid array range.

## Fix

Changed the loop condition to:

```java
i < numbers.length
```

## Test Cases

- `[1, 2, 3, 4]` → `10`
- `[]` → `0`

## Key Learning

Java array indexes start at `0`. Always use `i < array.length` when traversing an array to avoid off-by-one errors.