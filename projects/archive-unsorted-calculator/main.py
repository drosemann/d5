import math

def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    if b == 0:
        return "Error: Division by zero"
    return a / b

def power(a, b):
    return a ** b

def square_root(a):
    if a < 0:
        return "Error: Cannot calculate square root of negative number"
    return math.sqrt(a)

def factorial(a):
    if a < 0:
        return "Error: Cannot calculate factorial of negative number"
    if a == 0:
        return 1
    return math.factorial(int(a))

def sin(a):
    return math.sin(math.radians(a))

def cos(a):
    return math.cos(math.radians(a))

def tan(a):
    return math.tan(math.radians(a))

def log10(a):
    if a <= 0:
        return "Error: Cannot calculate log of non-positive number"
    return math.log10(a)

def natural_log(a):
    if a <= 0:
        return "Error: Cannot calculate log of non-positive number"
    return math.log(a)

def absolute_value(a):
    return abs(a)

def floor(a):
    return math.floor(a)

def ceil(a):
    return math.ceil(a)

def modulo(a, b):
    if b == 0:
        return "Error: Division by zero"
    return a % b

def percentage(a):
    return a / 100

def square(a):
    return a ** 2

def cube(a):
    return a ** 3

def inverse(a):
    if a == 0:
        return "Error: Division by zero"
    return 1 / a

def exponential(a):
    return math.exp(a)

def degrees_to_radians(a):
    return math.radians(a)

def radians_to_degrees(a):
    return math.degrees(a)

def hypotenuse(a, b):
    return math.hypot(a, b)

def fibonacci(n):
    if n <= 0:
        return "Error: Input must be positive"
    if n == 1 or n == 2:
        return 1
    a, b = 1, 1
    for _ in range(3, int(n) + 1):
        a, b = b, a + b
    return b

print("Welcome to the Advanced Calculator!")
print("Choose an operation:")
print("1. Addition")
print("2. Subtraction")
print("3. Multiplication")
print("4. Division")
print("5. Power")
print("6. Square Root")
print("7. Factorial")
print("8. Sine (in degrees)")
print("9. Cosine (in degrees)")
print("10. Tangent (in degrees)")
print("11. Log (base 10)")
print("12. Natural Log")
print("13. Absolute Value")
print("14. Floor")
print("15. Ceiling")
print("16. Modulo")
print("17. Percentage")
print("18. Square")
print("19. Cube")
print("20. Inverse (1/x)")
print("21. Exponential (e^x)")
print("22. Degrees to Radians")
print("23. Radians to Degrees")
print("24. Hypotenuse")
print("25. Fibonacci Number")

choice = input("Enter your choice (1-25): ")

# Functions that need two numbers
two_number_operations = {"1", "2", "3", "4", "5", "16", "24"}
# Functions that need one number
one_number_operations = {"6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "17", "18", "19", "20", "21", "22", "23", "25"}

if choice in two_number_operations:
    num1 = float(input("Enter the first number: "))
    num2 = float(input("Enter the second number: "))
elif choice in one_number_operations:
    num1 = float(input("Enter the number: "))

result = None

if choice == "1":
    result = add(num1, num2)
elif choice == "2":
    result = subtract(num1, num2)
elif choice == "3":
    result = multiply(num1, num2)
elif choice == "4":
    result = divide(num1, num2)
elif choice == "5":
    result = power(num1, num2)
elif choice == "6":
    result = square_root(num1)
elif choice == "7":
    result = factorial(num1)
elif choice == "8":
    result = sin(num1)
elif choice == "9":
    result = cos(num1)
elif choice == "10":
    result = tan(num1)
elif choice == "11":
    result = log10(num1)
elif choice == "12":
    result = natural_log(num1)
elif choice == "13":
    result = absolute_value(num1)
elif choice == "14":
    result = floor(num1)
elif choice == "15":
    result = ceil(num1)
elif choice == "16":
    result = modulo(num1, num2)
elif choice == "17":
    result = percentage(num1)
elif choice == "18":
    result = square(num1)
elif choice == "19":
    result = cube(num1)
elif choice == "20":
    result = inverse(num1)
elif choice == "21":
    result = exponential(num1)
elif choice == "22":
    result = degrees_to_radians(num1)
elif choice == "23":
    result = radians_to_degrees(num1)
elif choice == "24":
    result = hypotenuse(num1, num2)
elif choice == "25":
    result = fibonacci(num1)
else:
    print("Invalid choice. Please choose a number between 1 and 25.")

if result is not None:
    print(f"The result is: {result}")