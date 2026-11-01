# Bug 01: Greeter – NullPointerException

**Difficulty:** Easy  
**Topic:** Null Handling, Ternary Operator, String Methods  
**Status:** Fixed ✅

## 1. Problem

The `Greeter` class should greet a user by converting their name to uppercase.

Expected behavior:
- If a name is provided, return `Hello, NAME!`.
- If the name is `null`, greet the user as `GUEST`.

## 2. Original Buggy Code

```java
public String greet(String name) {
    return "Hello, " + name.toUpperCase() + "!";
}
```

## 3. Bug Identified

The method directly calls `toUpperCase()` on the `name` parameter without checking whether it is `null`.

When `name` is `null`, Java throws a `NullPointerException`.

## 4. Root Cause

The code assumes that the input will always contain a valid String.

However, Java allows reference variables to hold `null`. Calling an instance method on a null reference causes a `NullPointerException`.

## 5. My Approach

I used the ternary operator to check whether the input is null before calling `toUpperCase()`.

- If `name == null`, assign `"guest"`.
- Otherwise, use the original name.
- Convert the resulting String to uppercase.

## 6. Corrected Code

```java
public String greet(String name) {
    String greet = (name == null) ? "guest" : name;
    return "Hello, " + greet.toUpperCase() + "!";
}
```

## 7. Test Cases

| Input | Expected Output |
|---|---|
| `"ada"` | `Hello, ADA!` |
| `null` | `Hello, GUEST!` |

## 8. Verification

Command executed:

```bash
mvn test -Dtest=GreeterTest
```

Result:
- Tests run: 2
- Failures: 0
- Errors: 0
- Skipped: 0
- Build: SUCCESS

## 9. Key Learning

Always validate nullable inputs before calling instance methods.

**Concepts learned:** Null handling, NullPointerException, ternary operator, String methods, and JUnit testing.