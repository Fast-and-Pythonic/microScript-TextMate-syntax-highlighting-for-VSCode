/* JavaScript Syntax Demonstration */

// Variables
var oldVar = "This is old style";
let modernVar = "This is modern style";
const constantVar = 100;

// Data Types
let number = 42;
let string = "Hello, world!";
let boolean = true;
let obj = { key: "value" };
let arr = [1, 2, 3];
let undefinedVar;
let nullVar = null;

// Operators
let sum = 5 + 3;
let difference = 10 - 2;
let product = 4 * 2;
let quotient = 16 / 4;
let remainder = 10 % 3;
let power = 2 ** 3;

// Comparisons
let isEqual = (5 == "5"); // true
let isStrictEqual = (5 === "5"); // false
let isNotEqual = (5 != "5"); // false
let isGreater = (10 > 5);
let isLesser = (5 < 10);

// Logical Operators
let andOperation = true && false;
let orOperation = true || false;
let notOperation = !true;

// Conditional Statements
if (number > 20) {
    console.log("Number is greater than 20");
} else if (number === 42) {
    console.log("Number is 42");
} else {
    console.log("Number is less than 20");
}

// Switch Case
switch (string) {
    case "Hello":
        console.log("Greeting detected");
        break;
    case "Hello, world!":
        console.log("Full greeting detected");
        break;
    default:
        console.log("No match found");
}

// Loops
for (let i = 0; i < 5; i++) {
    console.log("For loop iteration", i);
}

let j = 0;
while (j < 5) {
    console.log("While loop iteration", j);
    j++;
}

do {
    console.log("Do-while executed at least once");
} while (false);

// Functions
function add(a, b) {
    return a + b;
}

a1 = 1
b1 = 2

add(a=a1, b=b1);

const subtract = (a, b) => a - b;
m = subtract(5, 3);

// Classes
class Animal {
    constructor(name) {
        super();
        this.name = name;
    }
    
    speak() {
        console.log(this.name + " makes a sound.");
    }
}

anim = new Animal("Animal");

class Dog extends Animal {
    speak() {
        console.log(this.name + " barks.");
    }
}

// Objects
let person = {
    firstName: "John",
    lastName: "Doe",
    age: 30,
    fullName: function() {
        return this.firstName + " " + this.lastName;
    }
};

person.age = 31;

// Try-Catch-Finally
try {
    let result = 10 / 0;
    throw new Error("Artificial error");
} catch (error) {
    console.log("Caught an error:", error.message);
} finally {
    console.log("Finally block executed");
}

// Promises and Async/Await
function asyncFunction() {
    return new Promise((resolve) => {
        setTimeout(() => resolve("Data fetched"), 1000);
    });
}

async function fetchData() {
    let data = await asyncFunction();
    console.log(data);
}

// Symbol
let sym1 = Symbol("unique");
let sym2 = Symbol("unique");
console.log(sym1 === sym2); // false

// Iterators & Generators
function* numberGenerator() {
    yield 1;
    yield 2;
    yield 3;
}

const gen = numberGenerator();
console.log(gen.next().value);
console.log(gen.next().value);
console.log(gen.next().value);

// JSON Handling
let jsonString = JSON.stringify(person);
let jsonObject = JSON.parse(jsonString);

// ES6 Modules (for browser or Node.js)
// import { someFunction } from "./module.js";
// export function someFunction() { return "Hello!"; }

// Event Listeners (for browser)
// document.addEventListener("click", () => console.log("Clicked!"));

// ...existing code...

// Object Creation Syntax Examples

// 1. Object Literal Notation
const obj1 = {
    name: "John",
    age: 30
};

// 2. Constructor Function
function Person(name, age) {
    this.name = name;
    this.age = age;
}
const obj2 = new Person("Jane", 25);

// 3. Object.create()
const prototype = {
    greet() {
        return `Hello, I'm ${this.name}`;
    }
};
const obj3 = Object.create(prototype);
obj3.name = "Mike";

// 4. Class Syntax (ES6+)
class User {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
}
const obj4 = new User("Alice", 28);

// 5. Factory Function
function createPerson(name, age) {
    return {
        name,
        age,
        greet() {
            return `Hi, I'm ${name}`;
        }
    };
}
const obj5 = createPerson("Bob", 35);

// 6. Object.assign()
const obj6 = Object.assign({}, { name: "Tom" }, { age: 40 });

// 7. Spread Operator (ES6+)
const baseObj = { type: "person" };
const obj7 = { ...baseObj, name: "Sarah", age: 32 };

// 8. Object.fromEntries()
const entries = [["name", "David"], ["age", 45]];
const obj8 = Object.fromEntries(entries);



console.log("JavaScript Syntax Demonstration Completed.");












