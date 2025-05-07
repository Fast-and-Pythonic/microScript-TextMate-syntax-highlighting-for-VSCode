# Python Keywords and Built-in Constants Demonstration

# False: Boolean false value
is_active = False

# None: Represents the absence of a value
result = None

# True: Boolean true value
is_valid = True

# and: Logical AND operator
if is_active and is_valid:
   print("Both conditions are true.")

# as: Used to create an alias
import math as m

# assert: Used for debugging purposes
assert is_valid, "The value must be valid."

# async and await: Used for asynchronous programming
import asyncio

async def fetch_data():
   await asyncio.sleep(1)
   return "Data fetched"
fetch_data()

# break: Terminates the nearest enclosing loop
for i in range(5):
   if i == 3:
      break
   print(i)

# class: Defines a class
class Animal:
   def __init__(self, name):
      self.name = name
p = 1
m = 2
r = 3
new_animal = Animal("Lion")

new_animal.name
dna(r, p=3, m="34")
# расширить класс Animal
class Cat(Animal):
   def __init__(self, name, breed):
      super().__init__(name)
      self.breed = breed

cat_1 = Cat("Whiskers", "Siamese")

# continue: Skips the current iteration of a loop
for i in range(5):
   if i == 3:
      continue
   print(i)

# def: Defines a function
def greet():
   return "Hello, World!"

# del: Deletes an object
x = 10
del x

# elif: Else if condition
if is_active:
   print("Active")
elif is_valid:
   print("Valid")

pass
# continue
# break
# return

# else: Else condition
if is_active:
   print("Active")
else:
   print("Inactive")

# except: Catches exceptions
try:
   1 / 0
except ZeroDivisionError:
   print("Cannot divide by zero.")

# finally: Executes code regardless of exceptions
try:
   1 / 0
except ZeroDivisionError:
   print("Cannot divide by zero.")
finally:
   print("Execution complete.")

# for: Looping over a sequence
for i in range(3):
   print(i)

# from: Imports specific parts of a module
from math import pi

# global: Declares a global variable
count = 0

def increment():
   global count
   count += 1

# if: Conditional statement
if is_valid:
   print("This is valid.")

# import: Imports a module
import os

# in: Checks for membership
if 'a' in 'apple':
   print("'a' is in 'apple'.")

# is: Tests object identity
if result is None:
   print("Result is None.")

# lambda: Creates an anonymous function
square = lambda x: x * x
print(square(5))

# nonlocal: Declares a non-local variable
def outer():
   y = 10
   def inner():
      nonlocal y
      y += 5
   inner()
   return y

# not: Logical NOT operator
if not is_active:
   print("Not active.")

# or: Logical OR operator
if is_active or is_valid:
   print("At least one condition is true.")

# pass: Null statement; does nothing
def placeholder():
   pass

# raise: Raises an exception
def positive_number(x):
   if x <= 0:
      raise ValueError("Must be positive.")

# return: Exits a function and returns a value
def add(a, b):
   return a + b

# try: Attempts to execute code that may raise an exception
try:
   file = open('nonexistent_file.txt')
except FileNotFoundError:
   print("File not found.")

# while: Repeats a block of code while a condition is true
n = 0
while n < 3:
   print(n)
   n += 1

# with: Context manager for resource management
with open('example.txt', 'w') as file:
   file.write('Hello, World!')

# yield: Pauses and resumes a generator function
def count_up_to(n):
   count = 1
   while count <= n:
      yield count
      count += 1

# Built-in Constants
# ------------------

# Ellipsis: Used in slicing and as a placeholder
def incomplete_function():
   ...

# NotImplemented: Indicates an unimplemented operation
class Number:
   def __eq__(self, other):
      if not isinstance(other, Number):
         return NotImplemented
      return self.value == other.value

# __debug__: Boolean value indicating if debugging is enabled
if __debug__:
   print("Debugging is enabled.")
