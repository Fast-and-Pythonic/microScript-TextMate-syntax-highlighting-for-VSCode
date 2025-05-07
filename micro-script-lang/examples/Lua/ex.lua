-- Lua Syntax Demonstration

----------------------------------------------------------------------
-- 1. Comments
----------------------------------------------------------------------

-- Single-line comment

--[[
Multi-line comment
]]

----------------------------------------------------------------------
-- 2. Variables and Data Types
----------------------------------------------------------------------

-- Lua is dynamically typed, so you don't need to declare the type.

-- Nil
local myNil = nil

-- Boolean
local myBool = true
local anotherBool = false

-- Number (Lua only has one number type, which is a double-precision floating point)
local myNumber = 42
local anotherNumber = 3.14

-- String
local myString = "Hello, world!"
local anotherString = 'Single quotes also work'
local multilineString = [[
This is a
multi-line string.
]]

-- Table (the only data structure in Lua, used for arrays and objects)
local myTable = {}

----------------------------------------------------------------------
-- 3. Operators
----------------------------------------------------------------------

-- Arithmetic Operators
local sum = 5 + 3         -- Addition
local difference = 10 - 2   -- Subtraction
local product = 4 * 2       -- Multiplication
local quotient = 16 / 4      -- Division
local power = 2 ^ 3         -- Exponentiation
local modulo = 10 % 3        -- Modulo

-- Relational Operators
local isEqual = (5 == 5)     -- Equal
local isNotEqual = (5 ~= 5)  -- Not equal
local isLess = (5 < 10)       -- Less than
local isGreater = (10 > 5)     -- Greater than
local isLessOrEqual = (5 <= 5)  -- Less than or equal
local isGreaterOrEqual = (10 >= 5) -- Greater than or equal

-- Logical Operators
local andOp = true and false   -- AND
local orOp = true or false     -- OR
local notOp = not true         -- NOT

-- String concatenation
local combinedString = "Hello" .. " " .. "Lua!"

----------------------------------------------------------------------
-- 4. Control Structures
----------------------------------------------------------------------

-- If Statements
local number = 42

if number > 20 then
   print("Number is greater than 20")
elseif number == 42 then
   print("Number is 42")
else
   print("Number is less than or equal to 20")
end

-- While Loops
local i = 0
while i < 5 do
   print("While loop iteration: " .. i)
   i = i + 1
end

-- For Loops (numeric)
for i = 1, 5 do -- i from 1 to 5
   print("Numeric For loop iteration: " .. i)
end

for i = 1, 10, 2 do -- i from 1 to 10, incrementing by 2
   print("Numeric For loop with step iteration: " .. i)
end

-- For Loops (generic)
local myTable = {"apple", "banana", "cherry"}
for index, value in ipairs(myTable) do
   print("Generic For loop: " .. index .. " - " .. value)
end

-- Repeat Until Loop (Do While equivalent)
local j = 0
repeat
   print("Repeat-until loop iteration: " .. j)
   j = j + 1
until j > 5

----------------------------------------------------------------------
-- 5. Functions
----------------------------------------------------------------------

-- Function Definition
local function add(a, b)
   return a + b
end

-- Function Call
local sum = add(5, 3)
print("Sum: " .. sum)

-- Anonymous Function (Lambda)
local multiply = function(a, b)
   return a * b
end

local product = multiply(4, 6)
print("Product: " .. product)

-- Variadic Functions
local function printAll(...)
   local args = {...}
   for i, v in ipairs(args) do
      print("Argument " .. i .. ": " .. v)
   end
end

printAll("one", 2, true)

----------------------------------------------------------------------
-- 6. Tables (Arrays and Objects)
----------------------------------------------------------------------

-- Creating a Table (Array)
local myArray = {10, 20, 30}
print("Array element at index 1: " .. myArray[1])  -- Lua arrays start at index 1

-- Creating a Table (Object/Dictionary)
local myObject = {
   name = "John",
   age = 30,
   city = "New York"
}

print("Object property 'name': " .. myObject.name)
print("Object property 'age': " .. myObject["age"]) -- Alternative way to access properties

-- Adding and Modifying Table Elements
myArray[4] = 40
myObject.occupation = "Engineer"

-- Table Iteration
for key, value in pairs(myObject) do
   print("Key: " .. key .. ", Value: " .. value)
end

----------------------------------------------------------------------
-- 7. Metatables and Metamethods
----------------------------------------------------------------------

-- Metatables allow you to overload operators for tables.

-- Creating two tables
local table1 = {1, 2, 3}
local table2 = {4, 5, 6}

-- Creating a metatable for table1
local metatable = {}

-- Defining the __add metamethod
metatable.__add = function(t1, t2)
   local result = {}
   for i = 1, #t1 do
      result[i] = t1[i] + t2[i]
   end
   return result
end

-- Setting the metatable for table1
setmetatable(table1, metatable)

-- Now you can add table1 and table2 using the + operator
local sumTable = table1 + table2

-- Printing the result
for i, v in ipairs(sumTable) do
   print("SumTable[" .. i .. "] = " .. v)
end

----------------------------------------------------------------------
-- 8. Modules
----------------------------------------------------------------------

-- Creating a simple module (myModule.lua):
--[[
local myModule = {}

function myModule.greet(name)
   print("Hello, " .. name .. "!")
end

return myModule
--]]

-- Using the module:
-- require("myModule").greet("Alice")

----------------------------------------------------------------------
-- 9. Error Handling
----------------------------------------------------------------------

-- pcall (protected call) executes a function in protected mode.

local status, result = pcall(function()
   -- Code that might cause an error
   error("Something went wrong!")
end)

if not status then
   print("Error caught: " .. result)
end

----------------------------------------------------------------------
-- 10. Coroutines
----------------------------------------------------------------------

-- Coroutines are like lightweight threads.

-- Creating a coroutine
local myCoroutine = coroutine.create(function()
   print("Coroutine started")
   coroutine.yield()
   print("Coroutine resumed")
end)

-- Starting the coroutine
coroutine.resume(myCoroutine)

-- Resuming the coroutine
coroutine.resume(myCoroutine)

----------------------------------------------------------------------
-- 11. Scope
----------------------------------------------------------------------

-- Local variables are declared with the `local` keyword and are only
-- accessible within the block they are defined.
-- Global variables are accessible from anywhere in the script.

local localVar = "I am local"
globalVar = "I am global" -- Avoid creating global variables unintentionally

local function testScope()
   local localVarInner = "I am local inner"
   print(globalVar) -- accessible
end

testScope()
-- print(localVarInner) -- error: localVarInner is out of scope
print(globalVar)

----------------------------------------------------------------------
-- 12. Closures
----------------------------------------------------------------------

-- A closure is a function that retains access to variables from its
-- surrounding scope, even after the outer function has finished executing.

local function outerFunction(x)
   local y = 10

   local function innerFunction(z)
      return x + y + z  -- Accessing x and y from the outer scope
   end

   return innerFunction
end

local myClosure = outerFunction(5)
print(myClosure(3)) -- Output: 18 (5 + 10 + 3)






