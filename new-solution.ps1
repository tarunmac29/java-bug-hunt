param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("easy", "medium")]
    [string]$Difficulty,

    [Parameter(Mandatory = $true)]
    [ValidateRange(1, 100)]
    [int]$BugNumber
)

$ErrorActionPreference = "Stop"

$bugFolder = "bug{0:D2}" -f $BugNumber
$solutionDir = Join-Path "solutions" (Join-Path $Difficulty $bugFolder)
$javaFile = Join-Path $solutionDir "FixedSolution.java"
$readmeFile = Join-Path $solutionDir "README.md"

if (-not (Test-Path $solutionDir)) {
    New-Item -ItemType Directory -Path $solutionDir -Force | Out-Null
}

$packageName = "solutions.$Difficulty.$bugFolder"

if (-not (Test-Path $javaFile)) {
    $javaContent = @"
package $packageName;

public class FixedSolution {

    // TODO: Add your corrected implementation here.
}
"@
    Set-Content -Path $javaFile -Value $javaContent -Encoding UTF8
    Write-Host "Created: $javaFile" -ForegroundColor Green
}
else {
    Write-Host "Already exists, leaving unchanged: $javaFile" -ForegroundColor Yellow
}

if (-not (Test-Path $readmeFile)) {
    $readmeContent = @"
# $($Difficulty.ToUpper()) – Bug $($BugNumber.ToString("D2"))

## Problem
Describe the incorrect behaviour.

## Root Cause
Explain why the original code was incorrect.

## Original Buggy Code
Add the relevant original code here.

## Fix
Explain what you changed and why.

## Corrected Code
See `FixedSolution.java`.

## Test Cases
- Input:
- Expected output:
- Actual output:

## How to Run Tests
``````bash
mvn test -Dtest=YourTestClass
``````

## Key Learning
Write the main concept learned from this bug.
"@
    Set-Content -Path $readmeFile -Value $readmeContent -Encoding UTF8
    Write-Host "Created: $readmeFile" -ForegroundColor Green
}
else {
    Write-Host "Already exists, leaving unchanged: $readmeFile" -ForegroundColor Yellow
}

Start-Process notepad.exe -ArgumentList (Resolve-Path $javaFile).Path
Start-Process notepad.exe -ArgumentList (Resolve-Path $readmeFile).Path

Write-Host ""
Write-Host "Done. Fill in both files, then review with: git status" -ForegroundColor Cyan
