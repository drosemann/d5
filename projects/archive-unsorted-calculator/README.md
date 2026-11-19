# Advanced Calculator

A powerful command-line calculator with 25 mathematical operations, built in Python.

## Features

- Basic arithmetic operations (addition, subtraction, multiplication, division)
- Power functions (power, square, cube, square root)
- Trigonometric functions (sine, cosine, tangent)
- Logarithmic functions (natural log, log base 10)
- Number theory (factorial, Fibonacci)
- Utility functions (floor, ceiling, absolute value)
- Angular conversions (degrees to radians, radians to degrees)
- Special calculations (percentage, inverse, exponential, hypotenuse)

## Requirements

- Python 3.x
- Math module (built into Python)

## Installation

1. Clone or download this repository
2. No additional packages need to be installed as the program uses only built-in Python modules

## Usage

1. Run the program:
   ```
   python main.py
   ```

2. Choose an operation by entering its corresponding number (1-25):
   ```
   Welcome to the Advanced Calculator!
   Choose an operation:
   1. Addition
   2. Subtraction
   3. Multiplication
   4. Division
   5. Power
   6. Square Root
   7. Factorial
   8. Sine (in degrees)
   9. Cosine (in degrees)
   10. Tangent (in degrees)
   11. Log (base 10)
   12. Natural Log
   13. Absolute Value
   14. Floor
   15. Ceiling
   16. Modulo
   17. Percentage
   18. Square
   19. Cube
   20. Inverse (1/x)
   21. Exponential (e^x)
   22. Degrees to Radians
   23. Radians to Degrees
   24. Hypotenuse
   25. Fibonacci Number
   ```

3. Enter the required number(s) when prompted

## Examples

### Basic Operations
- Addition (1):
  ```
  Enter your choice (1-25): 1
  Enter the first number: 5
  Enter the second number: 3
  The result is: 8
  ```

### Trigonometric Functions
- Sine (8):
  ```
  Enter your choice (1-25): 8
  Enter the number: 90
  The result is: 1.0
  ```

### Special Functions
- Factorial (7):
  ```
  Enter your choice (1-25): 7
  Enter the number: 5
  The result is: 120
  ```

### Error Handling
The calculator includes error handling for common mathematical errors:
- Division by zero
- Square root of negative numbers
- Factorial of negative numbers
- Logarithm of non-positive numbers

## Function Descriptions

1. **Addition**: Adds two numbers
2. **Subtraction**: Subtracts second number from first
3. **Multiplication**: Multiplies two numbers
4. **Division**: Divides first number by second
5. **Power**: Raises first number to the power of second
6. **Square Root**: Calculates square root of a number
7. **Factorial**: Calculates n! (n factorial)
8. **Sine**: Calculates sine of an angle in degrees
9. **Cosine**: Calculates cosine of an angle in degrees
10. **Tangent**: Calculates tangent of an angle in degrees
11. **Log (base 10)**: Calculates common logarithm
12. **Natural Log**: Calculates natural logarithm (base e)
13. **Absolute Value**: Returns absolute value of a number
14. **Floor**: Rounds down to nearest integer
15. **Ceiling**: Rounds up to nearest integer
16. **Modulo**: Returns remainder of division
17. **Percentage**: Converts number to percentage (divides by 100)
18. **Square**: Multiplies number by itself
19. **Cube**: Raises number to power of 3
20. **Inverse**: Calculates 1/x
21. **Exponential**: Calculates e^x
22. **Degrees to Radians**: Converts angles from degrees to radians
23. **Radians to Degrees**: Converts angles from radians to degrees
24. **Hypotenuse**: Calculates hypotenuse using Pythagorean theorem
25. **Fibonacci**: Calculates nth Fibonacci number

## Notes
- Trigonometric functions accept input in degrees for user convenience
- For best results, enter numerical values only
- The calculator handles decimal numbers
<!-- ZIMBU-PORT -->
## Zimbu-Port

Dieses Projekt ist mechanisch nach [Zimbu](https://moolenaar.net/z/zimbu/spec/zimbu.html)
(Bram Moolenaar) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.zimbu-Schwester
mit Zimbu-Modulgeruest (MODULE/FUNC Main) und dem VOLLSTAENDIGEN Original-Code
als #-Inline-Doku. Kein Original-Code wurde geloescht oder veraendert.
Die .zimbu-Dateien sind mechanische Spiegel (80/20: Geruest steht, Logik-Port
per Hand verfeinern). Stand: 2026-11-12.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
