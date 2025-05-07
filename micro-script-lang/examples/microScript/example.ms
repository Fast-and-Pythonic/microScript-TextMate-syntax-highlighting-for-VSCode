Comprehensive Guide to microScript Syntax for Syntax Highlighting in VS Code
This document provides a complete demonstration of all syntax elements in microScript, the programming language used in microStudio. The code examples below are designed to showcase every possible syntax feature to ensure your VS Code syntax highlighting works correctly in all scenarios.

Variable Declaration and Data Types
Basic Variable Assignment
text

// Basic variable declarations - no keywords needed
name = "Player"
score = 100
active = true
empty = null

// Variables can be reassigned with different types
flexible = 42
flexible = "now I'm a string"

// Multiple assignment
x = y = z = 0

// Local and global variables
function scope_example()
  local inner_var = "local scope"  // Only available in this function
  global shared_var = "global scope"  // Available everywhere
end
Primitive Data Types
text
// Numbers (no distinction between integers and floats)
integer = 42
float_number = 3.14159
scientific = 1.5e6
negative = -10

// Strings with different quote styles
single_quotes = 'Hello microStudio'
double_quotes = "Hello microStudio"
multiline = "This string
spans multiple
lines"

// Booleans
true_value = true
false_value = false

// Null
empty_value = null
Collections and Complex Types
text
// Lists (arrays)
empty_list = []
numbers = [1, 2, 3, 4, 5]
mixed = [1, "two", true, [4, 5]]  // Nested list

// Accessing list elements (zero-based indexing)
first = numbers[0]  // Result: 1
nested = mixed[3][1]  // Result: 5

// Objects (similar to dictionaries/maps)
empty_object = {}
player = {
  name: "Hero",
  health: 100,
  position: {x: 0, y: 0}  // Nested object
}

// Accessing object properties
player_name = player.name  // Dot notation
position_x = player["position"]["x"]  // Bracket notation
Operators
Arithmetic Operators
text
// Basic arithmetic
sum = 5 + 3
difference = 10 - 2
product = 4 * 2
quotient = 16 / 4
remainder = 10 % 3
power = 2 ^ 3  // Exponentiation (2³)

// Unary operators
negative = -10
positive = +5  // Rarely used, but valid

// Compound assignment
count = 0
count += 5   // count = count + 5
count -= 2   // count = count - 2
count *= 3   // count = count * 3
count /= 2   // count = count / 2
count %= 3   // count = count % 3
Comparison Operators
text
// Equality and inequality
equal = 5 == 5
not_equal = 5 != 10

// Relational operators
greater = 10 > 5
less = 5 < 10
greater_equal = 10 >= 10
less_equal = 5 <= 5
Logical Operators
text
// Logical operations
and_result = true and false  // Result: false
or_result = true or false    // Result: true
not_result = not true        // Result: false

// Chaining logical operators
complex = (5 > 3) and (10 != 5 or not false)
Binary Operators
text
// Binary operations (introduced in microScript 2.0)
bit_and = 5 & 3        // Bitwise AND
bit_or = 5 | 3         // Bitwise OR
left_shift = 5 << 1    // Left shift
right_shift = 5 >> 1   // Right shift
Control Structures
Conditional Statements
text
// If statement
if score > 100 then
  print("High score!")
end

// If-else statement
if health <= 0 then
  print("Game Over")
else
  print("Still alive")
end

// If-elsif-else for multiple conditions
if score > 1000 then
  rank = "Master"
elsif score > 500 then
  rank = "Expert"
elsif score > 100 then
  rank = "Novice"
else
  rank = "Beginner"
end

// Compact conditional for simple cases
if is_active then do_something() end
Loops
text
// While loop
count = 0
while count < 5 do
  print(count)
  count += 1
end

// For loop with numeric range
for i = 0 to 5 do
  print(i)  // Prints 0, 1, 2, 3, 4, 5
end

// For loop with step value
for i = 0 to 10 by 2 do
  print(i)  // Prints 0, 2, 4, 6, 8, 10
end

// For loop with negative step
for i = 10 to 0 by -1 do
  print(i)  // Countdown 10 to 0
end

// For loop with list iteration
fruits = ["apple", "banana", "cherry"]
for fruit in fruits do
  print(fruit)
end

// Breaking out of loops
i = 0
while true do
  i += 1
  if i > 10 then
    break
  end
end

// Continuing to next iteration
for i = 0 to 10 do
  if i % 2 == 0 then
    continue  // Skip even numbers
  end
  print(i)
end
Functions
Function Definition and Calling
text
// Basic function definition
greet = function()
  print("Hello, world!")
end

// Function with parameters
add = function(a, b)
  return a + b
end

// Calling functions
greet()
sum = add(5, 3)  // Result: 8

// Functions with default parameter values
greet_person = function(name = "Guest")
  print("Hello, " + name)
end

greet_person()        // Prints: Hello, Guest
greet_person("Alex")  // Prints: Hello, Alex

// Named parameters
create_enemy = function(health = 100, speed = 5, power = 10)
  return {health: health, speed: speed, power: power}
end

// Can call with named parameters in any order
boss = create_enemy(power = 50, health = 500)
minion = create_enemy(speed = 10)

// Functions that return multiple values via objects
get_player_stats = function()
  return {
    health: 100,
    mana: 50,
    position: {x: 10, y: 20}
  }
end

stats = get_player_stats()
player_health = stats.health
Function as First-Class Objects
text
// Storing functions in variables
operation = add  // Reference to the add function
result = operation(10, 20)  // Calls add(10, 20)

// Functions as parameters
apply_twice = function(func, value)
  return func(func(value))
end

double = function(x)
  return x * 2
end

quad_value = apply_twice(double, 3)  // Result: 12

// Anonymous functions
sorted = [5, 2, 8, 1].sort(function(a, b)
  return a - b
end)
Objects and Classes
Objects
text
// Creating an object
player = object
  x = 0
  y = 0
  speed = 5
  
  move = function(dx, dy)
    this.x += dx * this.speed
    this.y += dy * this.speed
  end
  
  get_position = function()
    return {x: this.x, y: this.y}
  end
end

// Using object methods
player.move(1, 0)  // Move right
pos = player.get_position()

// Object literal syntax (alternative)
enemy = {
  x: 100,
  y: 100,
  attack: function(target)
    // Attack logic
  end
}
Classes
text
// Class definition
Character = class
  // Constructor
  constructor = function(name, health)
    this.name = name
    this.health = health
  end
  
  take_damage = function(amount)
    this.health -= amount
    if this.health < 0 then this.health = 0 end
  end
  
  is_alive = function()
    return this.health > 0
  end
end

// Class inheritance
Hero = class extends Character
  constructor = function(name, health, power)
    super(name, health)  // Call parent constructor
    this.power = power
  end
  
  attack = function(target)
    target.take_damage(this.power)
    return this.name + " attacked " + target.name
  end
end

// Creating instances
enemy = new Character("Goblin", 50)
hero = new Hero("Arthur", 100, 15)

// Using methods
hero.attack(enemy)
is_enemy_alive = enemy.is_alive()
Advanced Features (microScript 2.0)
Threading and Coroutines
text
// Creating a background task
background_task = function()
  for i = 1 to 100 do
    print("Background task: " + i)
    sleep(1)  // Pause for 1 second
  end
end

// Start as a parallel thread
spawn background_task()

// Schedule a task to run after a delay
after 5 do
  print("5 seconds have passed")
end

// Create a periodic task
every 2 do
  print("This runs every 2 seconds")
end
Operator Overloading
text
Vector = class
  constructor = function(x, y)
    this.x = x
    this.y = y
  end
  
  // Overload + operator
  "+" = function(other)
    return new Vector(this.x + other.x, this.y + other.y)
  end
  
  // Overload * operator
  "*" = function(scalar)
    if typeof scalar == "number" then
      return new Vector(this.x * scalar, this.y * scalar)
    end
    return null
  end
  
  // String representation
  toString = function()
    return "Vector(" + this.x + "," + this.y + ")"
  end
end

// Using overloaded operators
v1 = new Vector(1, 2)
v2 = new Vector(3, 4)
v3 = v1 + v2        // v3 is Vector(4, 6)
v4 = v1 * 2         // v4 is Vector(2, 4)
Game Development Specific Features
Main Game Functions
text
// Initialization - called once when program starts
init = function()
  // Game setup code
  player = {
    x: screen.width / 2,
    y: screen.height / 2,
    speed: 5,
    health: 100
  }
  
  enemies = []
  for i = 1 to 5 do
    enemies.push({
      x: Math.random() * screen.width,
      y: Math.random() * screen.height,
      speed: 2
    })
  end
  
  game_over = false
  score = 0
end

// Update - called every frame to update game logic
update = function()
  // Handle input
  if keyboard.UP then
    player.y -= player.speed
  end
  
  if keyboard.DOWN then
    player.y += player.speed
  end
  
  if keyboard.LEFT then
    player.x -= player.speed
  end
  
  if keyboard.RIGHT then
    player.x += player.speed
  end
  
  // Handle touch input
  if touch.touching then
    player.x = touch.x
    player.y = touch.y
  end
  
  // Update game entities
  update_enemies()
  check_collisions()
  
  // Increase score over time
  if not game_over then
    score += 0.1
  end
end

// Draw - called every frame to render graphics
draw = function()
  // Clear the screen
  screen.clear()
  
  // Draw background
  screen.fillRect(0, 0, screen.width, screen.height, "black")
  
  // Draw player
  screen.fillCircle(player.x, player.y, 10, "blue")
  
  // Draw enemies
  for enemy in enemies do
    screen.fillCircle(enemy.x, enemy.y, 8, "red")
  end
  
  // Draw UI
  screen.drawText("Score: " + Math.floor(score), 10, 10, 20, "white")
  screen.drawText("Health: " + player.health, 10, 40, 20, "white")
  
  // Draw game over message if applicable
  if game_over then
    screen.drawText("GAME OVER", screen.width/2-100, screen.height/2, 40, "red")
  end
end
Screen and Graphics Functions
text
// Drawing functions
draw_examples = function()
  // Clear the screen
  screen.clear()
  
  // Draw geometrical shapes
  screen.fillRect(10, 10, 100, 50, "red")
  screen.drawRect(10, 70, 100, 50, "blue")
  screen.fillRound(150, 35, 80, 40, 10, "green")
  screen.drawRound(150, 95, 80, 40, 10, "yellow")
  screen.fillCircle(280, 35, 30, "purple")
  screen.drawCircle(280, 95, 30, "cyan")
  screen.drawLine(10, 150, 300, 150, "white")
  screen.fillPolygon([10,50,90,10,50,90], "orange")
  
  // Draw sprites (assuming sprites have been created)
  screen.drawSprite("player", 200, 200, 64)
  screen.drawSprite("enemy", 300, 200, 48, 0, 1, 1, 0.8)  // With rotation and transparency
  
  // Draw text
  screen.drawText("Hello microStudio!", 100, 300, 20, "white")
  screen.setFont("Arial", 16)
  screen.drawText("Custom font", 100, 330, 16, "#00FFFF")
  
  // Drawing with different blend modes
  screen.setBlending("add")
  screen.fillCircle(150, 400, 30, "rgba(255,0,0,0.5)")
  screen.fillCircle(180, 400, 30, "rgba(0,255,0,0.5)")
  screen.setBlending("normal")
end
Input Handling
text
// Complete input handling example
handle_input = function()
  // Keyboard input
  if keyboard.UP or keyboard.W then
    player.y -= player.speed
  end
  
  if keyboard.DOWN or keyboard.S then
    player.y += player.speed
  end
  
  if keyboard.LEFT or keyboard.A then
    player.x -= player.speed
  end
  
  if keyboard.RIGHT or keyboard.D then
    player.x += player.speed
  end
  
  // Space key just pressed
  if keyboard.SPACE and not keyboard.SPACE.pressed then
    shoot()
    keyboard.SPACE.pressed = true
  elsif not keyboard.SPACE then
    keyboard.SPACE.pressed = false
  end
  
  // Touch and mouse input
  if touch.touching then
    // Current touch position
    touch_x = touch.x
    touch_y = touch.y
    
    // Touch just started
    if touch.pressed then
      handle_touch_start(touch_x, touch_y)
    end
    
    // Touch is moving
    if touch.moving then
      handle_touch_move(touch_x, touch_y)
    end
  end
  
  // Touch just ended
  if touch.released then
    handle_touch_end(touch.x, touch.y)
  end
  
  // Gamepad input (if available)
  if gamepad.A then
    jump()
  end
  
  if gamepad.B then
    attack()
  end
  
  // Analog stick
  move_x = gamepad.LX  // -1 to 1
  move_y = gamepad.LY  // -1 to 1
  
  if Math.abs(move_x) > 0.1 or Math.abs(move_y) > 0.1 then
    player.x += move_x * player.speed
    player.y += move_y * player.speed
  end
end
Audio Features
text
// Audio examples
audio_examples = function()
  // Play a sound (assuming sounds have been created)
  audio.play("explosion")
  
  // Play music with looping
  audio.play("background_music", true)
  
  // Stop a sound
  audio.stop("background_music")
  
  // Set volume (0-1)
  audio.setVolume("background_music", 0.5)
  
  // Create a sound programmatically
  create_sound = function()
    // Create a new sound (1 second at 44.1kHz)
    my_sound = audio.createSound(44100)
    
    // Generate a simple sine wave
    for i = 0 to 44100 do
      my_sound.setSample(i, Math.sin(i * 0.1) * 0.5)
    end
    
    // Play the generated sound
    my_sound.play()
  end
  
  // Create a beep sound
  create_beep = function(frequency = 440, duration = 0.5)
    // Create a sound
    beep = audio.createSound(Math.floor(44100 * duration))
    
    // Fill with sine wave
    for i = 0 to beep.length-1 do
      beep.setSample(i, Math.sin(i * frequency * 2 * Math.PI / 44100) * 0.5)
    end
    
    return beep
  end
  
  // Create and play beep
  my_beep = create_beep(880, 0.2)
  my_beep.play()
end
Comments and Documentation
text
// Single-line comment

/*
  Multi-line comment
  that spans several lines
  useful for documentation
*/

/*
 * Documentation style comment
 * @param {number} x - The x coordinate
 * @param {number} y - The y coordinate
 * @returns {number} The distance from origin
 */
distance = function(x, y)
  return Math.sqrt(x*x + y*y)
end
Error Handling
text
// Basic error handling
try_operation = function()
  try
    // Operation that might fail
    result = some_risky_function()
    return result
  catch
    // Error handling
    print("An error occurred")
    return null
  end
end

// A more complex example
validate_user = function(user)
  try
    if not user then
      throw("User is null")
    end
    
    if not user.name then
      throw("User has no name")
    end
    
    if user.age < 18 then
      throw("User is underage")
    end
    
    return true
  catch error
    print("Validation failed: " + error)
    return false
  end
end
String and Math Operations
text
// String operations
string_examples = function()
  text = "Hello microScript!"
  
  // Basic operations
  length = string.length(text)
  upper = string.upper(text)
  lower = string.lower(text)
  
  // Substring
  sub = string.sub(text, 0, 5)  // "Hello"
  
  // Find and replace
  position = string.find(text, "micro")
  replaced = string.replace(text, "micro", "MICRO")
  
  // Concatenation
  full = "Hello " + "world" + "!"
  
  // Conversion
  num_to_str = string(42)
  str_to_num = number("42")
  
  return {
    length: length,
    upper: upper,
    lower: lower,
    sub: sub,
    position: position,
    replaced: replaced,
    full: full
  }
end

// Math operations
math_examples = function()
  // Constants
  pi = Math.PI
  e = Math.E
  
  // Basic functions
  sqrt = Math.sqrt(16)
  power = Math.pow(2, 3)  // Alternative to 2 ^ 3
  
  // Trigonometric functions
  sin = Math.sin(Math.PI / 2)
  cos = Math.cos(0)
  tan = Math.tan(Math.PI / 4)
  
  // Inverse trigonometric functions
  asin = Math.asin(1)
  acos = Math.acos(0)
  atan = Math.atan(1)
  atan2 = Math.atan2(1, 1)
  
  // Rounding
  floor = Math.floor(3.7)
  ceil = Math.ceil(3.2)
  round = Math.round(3.5)
  
  // Other functions
  abs = Math.abs(-10)
  min = Math.min(5, 10, 3)
  max = Math.max(5, 10, 3)
  
  // Random numbers
  rand = Math.random()  // 0 to 1
  rand_range = Math.floor(Math.random() * 10)  // 0 to 9
  
  return {
    pi: pi,
    sqrt: sqrt,
    sin: sin,
    floor: floor,
    rand: rand
  }
end
Working with Offscreen Images
text
// Image manipulation
image_examples = function()
  // Create a 100x100 image
  img = screen.createImage(100, 100)
  
  // Fill with a color
  img.fillRect(0, 0, 100, 100, "black")
  
  // Draw some random stars
  for i = 0 to 50 do
    x = Math.random() * 100
    y = Math.random() * 100
    size = 1 + Math.random() * 3
    img.fillCircle(x, y, size, "white")
  end
  
  // Create a gradient
  for y = 0 to 100 do
    color = "rgba(255," + y*2.55 + ",0,1)"
    img.drawLine(0, y, 100, y, color)
  end
  
  // Draw the image
  screen.drawImage(img, 200, 200)
  
  // Save the image (if supported)
  screen.saveImage(img, "stars.png")
  
  return img
end
Miscellaneous Features
text
// Type checking
check_types = function(value)
  if typeof value == "number" then
    return "It's a number"
  elsif typeof value == "string" then
    return "It's a string"
  elsif typeof value == "boolean" then
    return "It's a boolean"
  elsif typeof value == "function" then
    return "It's a function"
  elsif typeof value == "object" then
    return "It's an object"
  else
    return "Unknown type"
  end
end

// List operations
list_examples = function()
  fruits = ["apple", "banana", "cherry"]
  
  // Add/remove items
  fruits.push("orange")  // Add to end
  fruits.pop()           // Remove from end
  fruits.insert(0, "kiwi")  // Insert at position
  fruits.remove("banana")   // Remove by value
  fruits.splice(1, 2)       // Remove range
  
  // Find items
  index = fruits.indexOf("cherry")
  contains = fruits.includes("apple")
  
  // Transform list
  doubled = [1, 2, 3].map(function(x)
    return x * 2
  end)
  
  evens = [1, 2, 3, 4, 5].filter(function(x)
    return x % 2 == 0
  end)
  
  sum = [1, 2, 3, 4].reduce(function(total, x)
    return total + x
  end, 0)
  
  // Sort
  sorted = [3, 1, 4, 2].sort()
  
  return {
    fruits: fruits,
    doubled: doubled,
    evens: evens,
    sum: sum,
    sorted: sorted
  }
end

// Date and time
time_examples = function()
  // Current time (milliseconds since startup)
  current = time()
  
  // Format as string (if supported)
  formatted = date.format(time(), "YYYY-MM-DD")
  
  // Create relative timestamp
  future = time() + 60 * 1000  // 1 minute in the future
  
  return {
    current: current,
    future: future
  }
end
Conclusion
This comprehensive code example demonstrates all syntax features available in microScript, the language used in microStudio. It covers variable declarations, data types, operators, control structures, functions, objects, classes, and game-specific functionality. You can use this as a reference for creating a complete syntax highlighting extension for VS Code that will properly highlight all aspects of microScript code.

Remember that as microScript evolves (especially with microScript 2.0 additions), new syntax features may be added. This example represents the current state of the language based on available documentation.