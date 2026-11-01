# Bug 01: Greeter – NullPointerException

**Difficulty:** Easy  
**Topic:** Null Handling, Ternary Operator, String Methods, JUnit 5, Maven  
**Status:** Fixed ✅

## 1. Problem

The `Greeter` class should greet a user by converting their name to uppercase.

**Expected behavior:**
- If a name is provided, return `Hello, NAME!`.
- If the name is `null`, greet the user as `GUEST`.

## 2. Original Buggy Code

**File:** `src/main/java/com/amigoscode/bughunt/easy/bug01/Greeter.java`

```java
package com.amigoscode.bughunt.easy.bug01;

public class Greeter {

    public String greet(String name) {
        return "Hello, " + name.toUpperCase() + "!";
    }
}
```

## 3. Bug Identified

The method directly calls `toUpperCase()` on the `name` parameter without checking whether it is `null`.

When `name` is `null`, Java throws a `NullPointerException`.

## 4. Root Cause

The code assumes that the input will always contain a valid String.

However, Java allows reference variables to hold `null`. Calling an instance method on a null reference causes a `NullPointerException`.

## 5. How to Reproduce and Fix the Bug

### Step 1: Navigate to the project root

Open CMD or terminal inside the cloned repository:

```bash
cd java-bug-hunt
```

### Step 2: Run the original test

```bash
mvn test -Dtest=GreeterTest
```

The test `greetsNullAsGuest()` should fail with a `NullPointerException` because the original implementation does not handle null input.

### Step 3: Open the original Java file

```text
src/main/java/com/amigoscode/bughunt/easy/bug01/Greeter.java
```

### Step 4: Apply the fix

Replace the original implementation with:

```java
package com.amigoscode.bughunt.easy.bug01;

public class Greeter {

    public String greet(String name) {
        String greet = (name == null) ? "guest" : name;
        return "Hello, " + greet.toUpperCase() + "!";
    }
}
```

**How the fix works:**

- If `name == null`, the ternary operator assigns `"guest"`.
- Otherwise, it assigns the original name.
- `toUpperCase()` is called only after a non-null String is obtained.

### Step 5: Run the test again

```bash
mvn test -Dtest=GreeterTest
```

**Expected result:**

```text
Tests run: 2, Failures: 0, Errors: 0, Skipped: 0

BUILD SUCCESS
```

Both test cases should pass.

### Step 6: Preserve the original challenge

After verifying the fix, restore the original challenge file:

```bash
git restore src/main/java/com/amigoscode/bughunt/easy/bug01/Greeter.java
```

This keeps the original challenge unchanged in the repository.

Your permanent corrected implementation is documented separately in `FixedSolution.java`.

**Important:** `FixedSolution.java` is stored outside Maven's default source directory (`src/main/java`). Therefore, Maven does not automatically compile or test it. The Maven test above verifies the corrected implementation when temporarily applied to the original `Greeter.java`.

## 6. My Approach

I used the ternary operator to check whether the input is null before calling `toUpperCase()`.

- If the input is null, assign `"guest"`.
- Otherwise, use the original name.
- Convert the resulting String to uppercase.

This prevents the `NullPointerException` and provides a default guest greeting.

## 7. Test Cases

| Input | Expected Output |
|---|---|
| `"ada"` | `Hello, ADA!` |
| `null` | `Hello, GUEST!` |

## 8. Verification

**Command executed:**

```bash
mvn test -Dtest=GreeterTest
```

**Actual result after applying the fix:**

- Tests run: 2
- Failures: 0
- Errors: 0
- Skipped: 0
- Build: SUCCESS

## 9. Key Learning

- Always validate nullable inputs before calling instance methods.
- Understand how `NullPointerException` occurs.
- Use the ternary operator for simple conditional assignments.
- Use JUnit tests to reproduce and verify bugs.
- Preserve original challenge code and document corrected implementations separately.

**Concepts learned:** Null handling, NullPointerException, ternary operator, String methods, Maven, and JUnit 5.