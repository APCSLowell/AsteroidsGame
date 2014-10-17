Asteroids (Part 1)
==================
In this assignment we will start to replicate the old video game Asteroids. You will write a program that has a space ship that can be controlled with the keyboard. You will need to write a SpaceShip class. Your SpaceShip class will extend the Floater class, an abstract class that represents all things that float in space. 

An abstract class is an "incomplete" class. It has abstract methods--methods that have no body. When your class extends an abstract class, you must write the methods that are needed to "complete" the class. _Note: You will be writing two classes `SpaceShip` and `Star`. Do not modify the `Floater` class._

Sugested steps to completing this assignment
-----------------------------------

1. Fork and clone down the AsteroidsGame repository
2. Uncomment the `extends floater` on Line 10
3. Complete the 10 abstract set and get functions
4. Write a Spaceship constructor. Make sure you initialize all 7 of the inherited `protected` member variables. You may find the Asteroids PowerPoint slides to be helpful.
5. At the top of your program, declare a variable of type `SpaceShip`
6. Initialize the `SpaceShip` as a new instance of the class
7. In `draw()` call the SpaceShip's `show()` function
8. When you are happy with appearance of the SpaceShip, add a `public void keyPressed()` function to your program
9. Write code in `keyPressed` that allows you to control the space ship with the keyboard. You must include the ability to rotate left, rotate right, accelerate, and enter "hyperspace." (There is no requirement for any fancy visual effects, hyperspace just needs to stop the ship, and give it a new random position and direction.)
10. Add code to `draw()` to `move()` the Spaceship
11. Finally, add a Star class that creates a random number of stars in random positions
12. If you have extra time and are looking for a challenge, you might try to add an animation of "rockets" that appear from the back of the ship when you accelerate

These steps are only a suggestion. Your Asteroids game doesn't have to work or act like any other. Have fun and be creative.