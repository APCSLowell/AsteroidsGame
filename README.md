Asteroids (Part 1)
==================
In this assignment we will start to replicate the old video game Asteroids. You will write a program that has a space ship that can be controlled with the keyboard. You will need to write a `SpaceShip` class. Your `SpaceShip` class will extend the `Floater` class, an `abstract` class that represents all things that float in space. 

An `abstract` class is an "incomplete" class. It has `abstract` methods--incomplete methods that have no body. When your class extends an `abstract` class, you typically write the methods that are needed to "complete" the class. _Note: To complete this assignment you will be writing two classes `SpaceShip` and `Star`. Do not modify the `Floater` class._

Suggested steps to complete this assignment
-------------------------------------------

1. Fork [this repository](https://github.com/APCSLowell/AsteroidsGame).
2. Uncomment the `extends floater` on Line 10
3. Complete the 10 abstract `set` and `get` functions
4. Write the `Spaceship` constructor. Make sure you initialize all 9 of the inherited `protected` member variables. You may find the [Asteroids PowerPoint](https://drive.google.com/file/d/0Bz2ZkT6qWPYTYjU0NDE5ZDYtYzEwOS00MGNlLTk0OGMtODBhODI3N2JiYzRi/view?usp=sharing) slides and the [SpaceShip design worksheet](https://drive.google.com/file/d/0Bz2ZkT6qWPYTRDJvNUJRdXFjNGs/view?usp=sharing) helpful. You may also find [this sample SpaceShip program](https://56d4b6566b56a59e1f634ea30f548666c459899d.googledrive.com/host/0Bz2ZkT6qWPYTallTVFJBOWdNcDQ/) helpful in understanding how the variables affect the SpaceShip's movement.
5. At the top of your program, declare a variable of type `SpaceShip`
6. Initialize the `SpaceShip` as a new instance of the class
7. In `draw()` call the SpaceShip's `show()` function
8. When you are happy with appearance of the SpaceShip, add a `public void keyPressed()` function to your program
9. Write code in `keyPressed` that allows you to control the space ship with the keyboard. You must include the ability to rotate left, rotate right, accelerate, and enter "hyperspace." (There is no requirement for any fancy visual effects, hyperspace just needs to stop the ship, and give it a new random position and direction.)
10. Add code to `draw()` to `move()` the Spaceship
11. Finally, add a `Star` class that creates a random number of stars in random positions
12. Note that for full credit, **you MUST include instructions on how to operate your SpaceShip in the `index.html` file**
12. If you have extra time and are looking for a challenge, you might try to add an animation of "rockets" that appear from the back of the ship when you accelerate

These steps are only a suggestion. Your Asteroids game doesn't have to work or act like any other. Have fun and be creative.


Samples of Student Work
-----------------------
[Rebecca](http://rebeccachen1.github.io/AsteroidsGame/)  
[Vivian](http://vivianlam.github.io/AsteroidsGame/)  
[Erika](http://bekutaa.github.io/AsteroidsGame/)   
[Lucy](http://luchen825.github.io/AsteroidsGame/)   
[Zachary](https://zachooz.github.io/AsteroidsGame/)   
[Antonio](https://adcarmona.github.io/AsteroidsGame/)   
[Eric](http://ericheung1231.github.io/AsteroidsGame/)  
[Kirby](http://kichoy.github.io/AsteroidsGame/)   
[Averal](http://avekan33.github.io/AsteroidsGame/)   
[Lily](http://magicallilicorn.github.io/AsteroidsGame/)   
[Calvin](http://icalvin12.github.io/AsteroidsGame/)   
[Kenta](http://redtorch.github.io/AsteroidsGame/)   
[Thomas](http://tomikam.github.io/AsteroidsGame/)  
[Jeffrey](http://jeffreyyin1.github.io/AsteroidsGame/)  
[Aaron](http://aaronchowapcs.github.io/Lightning/)  
[Philip](http://philiphuang2.github.io/AsteroidsGame/)  
[David](http://inthehat.github.io/AsteroidsGame/)  
[Jessica](http://happyjessica97.github.io/AsteroidsGame/)   
[Chris](http://chrisma1.github.io/AsteroidsGame/)   

*This assignment was selected as a "Nifty CS Assignment" in 2008 by Nick Parlante @ Stanford*
