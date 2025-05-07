// Import necessary libraries
import java.util.Scanner;

// Define a class
class Animal {
   String name;
   
   // Constructor
   Animal(String name) {
      this.name = name;
   }
   
   // Method to print the animal's name
   void speak() {
      System.out.println(name + " makes a sound.");
   }
}

// Extend the Animal class
class Dog extends Animal {
   Dog(String name) {
      super(name);
   }
   
   // Override the speak method
   void speak() {
      System.out.println(name + " barks.");
   }
}

public class Main {
   public static void main(String[] args) {
      // Variables and data types
      int number = 42;
      String string = "Hello, world!";
      boolean booleanValue = true;
      
      // Conditional statements
      if (number > 20) {
         System.out.println("Number is greater than 20");
      } else if (number == 42) {
         System.out.println("Number is 42");
      } else {
         System.out.println("Number is less than 20");
      }
      
      // Loops
      for (int i = 0; i < 5; i++) {
         System.out.println("For loop iteration: " + i);
      }
      
      int j = 0;
      while (j < 5) {
         System.out.println("While loop iteration: " + j);
         j++;
      }
      
      // Functions
      int sum = add(5, 3);
      System.out.println("Sum: " + sum);
      
      // Classes and objects
      Animal animal = new Animal("Animal");
      animal.speak();
      
      Dog dog = new Dog("Dog");
      dog.speak();
      
      // Try-catch block
      try {
         int result = 10 / 0;
      } catch (ArithmeticException e) {
         System.out.println("Caught an error: " + e.getMessage());
      }
   }
   
   // Function to add two numbers
   static int add(int a, int b) {
      return a + b;
   }
}
