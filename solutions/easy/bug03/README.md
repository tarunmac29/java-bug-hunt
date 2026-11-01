# Bug 03 – RoleChecker (String Comparison Bug)

## Problem Description

The `RoleChecker` class checks whether a given role is an administrator.

The original implementation incorrectly uses the `==` operator to compare Strings.

## Original Buggy Code

```java
public boolean isAdmin(String role) {
    String normalized = role.trim().toUpperCase();
    return normalized == "ADMIN";
}
```

## Root Cause

In Java:

- `==` compares object references.
- `.equals()` compares the actual String content.

Therefore, using `==` can produce an incorrect result even when two Strings contain the same text.

## Corrected Code

```java
public boolean isAdmin(String role) {
    String normalized = role.trim().toUpperCase();
    return normalized.equals("ADMIN");
}
```

## Test Cases

| Input | Expected Output |
|---|---|
| `"ADMIN"` | `true` |
| `"admin"` | `true` |
| `" Admin "` | `true` |
| `"USER"` | `false` |

## How to Run Tests

```bash
mvn test -Dtest=RoleCheckerTest
```

## Key Learning

- `==` compares object references.
- `.equals()` compares String values.
- Use `.trim()` to remove leading and trailing whitespace.
- Use `.toUpperCase()` for case normalization.

## Bug Status

Corrected implementation prepared. Verify using the provided JUnit tests.