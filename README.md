Asteroids (Part 1)
==================
In this assignment we will start to replicate the old video game Asteroids. You will write a program that has a space ship that can be controlled with the keyboard. You will need to write a `Spaceship` class. Your `Spaceship` class will extend the `Floater` class, an `abstract` class that represents all things that float in space. 

An `abstract` class is an "incomplete" class. It has `abstract` methods--incomplete methods that have no body. When your class extends an `abstract` class, you typically write the methods that are needed to "complete" the class. _Note: To complete this assignment you will be writing two classes `Spaceship` and `Star`. Do not modify the `Floater` class._

Suggested steps to complete this assignment
-------------------------------------------

1. Fork [this repository](https://github.com/APCSLowell/AsteroidsGame). 
1. Open the program by opening `AsteroidsGame.pde` in Processing or opening the AsteroidsGame folder in Sublime.
2. Uncomment the `extends floater` on Line 1 of `Spaceship.pde`
3. Complete the 10 abstract `set` and `get` functions that the `Spaceship` class inherits from `Floater`
4. Write the `Spaceship` constructor. Make sure you initialize all 9 of the inherited `protected` member variables. You may find slides #1 - 58 on the [Asteroids](https://docs.google.com/presentation/d/1xEIchvoA0s2BO-HB8g9wjk1jSBH8sq9Gtkij5Y7slOs/edit?usp=sharing) and the [Spaceship design worksheet](https://drive.google.com/file/d/0Bz2ZkT6qWPYTRDJvNUJRdXFjNGs/view?usp=sharing) helpful. You may also find [this sample Spaceship program](https://apcslowell.github.io/AsteroidsVariableDemoV2/) helpful in understanding how the `protected Floater` variables affect the Spaceship's movement.
5. At the top of `AsteroidsGame.pde`, declare a variable of type `Spaceship`
6. Initialize the `Spaceship` as a new instance of the class
7. In `draw()` in `AsteroidsGame.pde` call the Spaceship's `show()` function
8. When you are happy with appearance of the Spaceship, add a `public void keyPressed()` function in `AsteroidsGame.pde`
9. Write code in `keyPressed` that allows you to control the spaceship with the keyboard. You must include the ability to turn left, turn right, accelerate, and enter "hyperspace." (There is no requirement for any fancy visual effects, hyperspace just needs to stop the ship, and give it a new random position and direction.)
10. Add code to the `draw()` in `AsteroidsGame.pde` to `move()` the Spaceship
11. Finish the `Star` class in `Star.pde` 
12. Finally, add code to `AsteroidsGame.pde` that declares and initializes an array of instances of the `Star` class to create a number of stars in random positions
12. Note that for full credit, **you MUST include instructions on how to operate your Spaceship in the `index.html` file**
12. OPTIONAL: If you have extra time and are looking for a challenge, you might try to add an animation of "rockets" that appear from the back of the ship when you accelerate, simliar to the [this sample Spaceship program](https://apcslowell.github.io/AsteroidsVariableDemoV2/). The best way to do this is to override `show()` by copying the `show()` function from Floater into your Spaceship class. Then add an `if` statement in your Spaceship `show()` function right after `endShape(CLOSE);`. If your rockets are firing, draw additional shapes just behind your Spaceship. You can sketch out the shapes on graph paper with the ship centered at (0,0) and pointing right. The `show()` function will rotate and translate the rocket shapes to the correct position on the screen.

These steps are only a suggestion. Your Asteroids game doesn't have to work or act like any other. Have fun and be creative.

Some important things to keep in mind
-------------------------------------
1. Abstract classes are "unfinished"
2. Abstract classes are one way that programmers can collaborate and divide up the work of a large program
3. You're collaborating! Some of the work for the `Ship` class has already been done in the `Floater` class. Don't change it! Your job is to extend the `Floater` class to "build on top of it" to make a `Ship` class. 
3. To create the `Ship` class you need to write a constructor and finish the "unfinished" `abstract` functions in `Floater`.
4. When you are sketching out your ship on th [Spaceship design worksheet](https://drive.google.com/file/d/0Bz2ZkT6qWPYTRDJvNUJRdXFjNGs/view?usp=sharing) make sure the ship is centered at (0,0) and pointing to the right
4. Don't declare any duplicate variables in your `Ship` class. You are inheriting all the variables you need from `Floater`
5. Make sure your `Spaceship` constructor initializes all 9 of the `protected` variables it inherits from `Floater`

Samples of Student Work
-----------------------
[Jack](https://paintcannon.github.io/AsteroidsGame/)   
[Erica](https://ericamalia.github.io/AsteroidsGame/)   
[Wilson](https://wilsonh415.github.io/AsteroidsGame/)   
[Elton](https://elel123.github.io/AsteroidsGame/)   
[Kenneth](https://kenpaso.github.io/AsteroidsGame/)   
[Hannah](https://hadecastro.github.io/AsteroidsGame/)   
[Joshua](https://joshualchan.github.io/AsteroidsGame/)   
[Steven](https://sjkchang.github.io/AsteroidsGame/)   
[Silas](https://silascs.github.io/AsteroidsGame/)   
[Ben](https://benjaminlanir.github.io/AsteroidsGame/)   
[Sam](https://flukemeister28.github.io/AsteroidsGame/)   
[Karen](https://sonokjw.github.io/AsteroidsGame/)   
[Andrew](https://ansue1234.github.io/AsteroidsGame/)   
[Thanawat](https://thiskappaisgrey.github.io/AsteroidsGame/index.html)   
[Jenna](https://jennaralll.github.io/AsteroidsGame/)   
[Katie](https://kachow4.github.io/AsteroidsGame/)   
[Michael](https://mipsim.github.io/AsteroidsGame/)   
[Olivia](https://vavies.github.io/AsteroidsGame/)   
[Eric](https://jellybeanmill.github.io/AsteroidsGame/)   
[Joanna](https://j0annalu.github.io/AsteroidsGame/)   
[Emily](https://emilyhasramen.github.io/AsteroidsGame/)   
[Kirby](https://krbyktl.github.io/AsteroidsGame/)   
[Dean](https://deanhuynh.github.io/AsteroidsGame/)   
[Ben](https://benjaminlanir.github.io/AsteroidsGame/)   
[Maxwell](https://12maxwellho.github.io/AsteroidsGame/)   
[Andrea](https://chenandrea29.github.io/AsteroidsGame/)   
[Yev](https://yevgeniybarkalov.github.io/AsteroidsGame/)   
[Garvin](https://garvingit.github.io/AsteroidsGame/)   
[Aaron](https://aahuangithub.github.io/AsteroidsGame2/)   
[Michael](https://mipsim.github.io/AsteroidsGame/)   
[Jenny](https://jexin.github.io/AsteroidsGame/)   
[Erica](https://ekwkk.github.io/AsteroidsGame/)   
[Edmund](https://edmundmah79.github.io/AsteroidsGame/)   
[Schuyler](https://skschur1.github.io/AsteroidsGame/)   
[Bryan](https://bzin22.github.io/AsteroidsGame/)   
[Emma](https://emmackenzie.github.io/AsteroidsGame/)   
[Kenny](https://kennyyu168.github.io/AsteroidsGame/)   
[Brandon](https://brandontom96.github.io/AsteroidsGame/)   
[Nicholas](https://woonicholas.github.io/AsteroidsGame/)   
[Raymond](https://ngoraymond.github.io/AsteroidsGame/)   
[Nathan](https://nathansng.github.io/AsteroidsGame/)   
[Steven](https://stliu8.github.io/AsteroidsGame/)   
[Brandon](https://zawszefl.github.io/AsteroidsGame/)   
[Preston](https://prestonttt.github.io/AsteroidsGame/)   
[Tatiana](https://sonotatiana.github.io/AsteroidsGame/)   
[Karen](https://sonokjw.github.io/AsteroidsGame/)   
[Kyle](https://yachtmasterkyle.github.io/AsteroidsGame/)   
[Michelle](https://miphung.github.io/AsteroidsGame/)   
[Jayden](https://jaydenlee1229.github.io/AsteroidsGame/)   
[Kevin](https://tig777.github.io/AsteroidsGame/)   
[Kyle](https://yachtmasterkyle.github.io/AsteroidsGame/)   
[Lydia](https://aqua28.github.io/AsteroidsGame/)   
[Jenna](https://jennaralll.github.io/AsteroidsGame/)   
[Otto](https://otschmidt.github.io/AsteroidsGame/)   
[Brandon](https://brandonchen114.github.io/AsteroidsGame/)   
[Andrew](https://ansue1234.github.io/AsteroidsGame/)   
[Darya](https://darya-ver.github.io/AsteroidsGame/)   
[Felix](https://felixzhuk.github.io/AsteroidsGame/)   
[Elton](https://elel123.github.io/AsteroidsGame/)   
[Robert](https://rshi159.github.io/AsteroidsGame/)   
[Skyler](https://skschur1.github.io/AsteroidsGame/)   
[Desmond](https://djmond.github.io/AsteroidsGame/)   
[Amanda](https://amkallenbach.github.io/AsteroidsGame/)   
[Eric](https://ericyu15.github.io/AsteroidsGame/)   
[Hannah](https://hadecastro.github.io/AsteroidsGame/)   
[Kendra](https://pastalover45.github.io/AsteroidsGame/)   
[Colin](https://licolin4.github.io/AsteroidsGame/)   
[Edmund](https://edmundmah79.github.io/AsteroidsGame/)   
[Andrew](https://andrewmai123.github.io/AsteroidsGame/)   
[Winfield](https://winfield101.github.io/AsteroidsGame/)   
[Jun](https://johyrao.github.io/AsteroidsGame/)   
[Steven](https://sjkchang.github.io/AsteroidsGame/)   
[Conna](https://connac.github.io/AsteroidsGame/)   
[Hannah](https://hadecastro.github.io/AsteroidsGame/)   
[Wilsom](https://wilsonh415.github.io/AsteroidsGame/)   
[Bryce](https://brycekeetonazaz.github.io/AsteroidsGame/)   
[Eric](https://jellybeanmill.github.io/AsteroidsGame/)   
[Maxwell](https://12maxwellho.github.io/AsteroidsGame/)   
[Kirby](https://krbyktl.github.io/AsteroidsGame/)   
[Garvin](https://garvingit.github.io/AsteroidsGame/)   
[Aaron](https://aahuangithub.github.io/AsteroidsGame1/)   
[Joshua](https://joshualchan.github.io/AsteroidsGame/)   
[Sam](https://flukemeister28.github.io/AsteroidsGame/)   
[Otto](https://otschmidt.github.io/AsteroidsGame/)   
[Steven](https://sjkchang.github.io/AsteroidsGame/)   
[Makoi](https://magacula1.github.io/AsteroidsGame/)   
[Brandon](https://brlou-apcs.github.io/AsteroidsGame/)   
[Kenneth](https://kenpaso.github.io/AsteroidsGame/)   
[Sophie](https://sohuang.github.io/AsteroidsGame/)   
[Nicholas](https://niguan.github.io/AsteroidsGame/)   
[Jessica](https://jtngai.github.io/AsteroidsGame/)   
[Kenny](https://kennyyu168.github.io/AsteroidsGame/)   
[Vivian](https://viviaann.github.io/AsteroidsGame/)   
[Conna](https://connac.github.io/AsteroidsGame/)   
[Janet](https://birded.github.io/AsteroidsGame/)   
[Emma](https://emmackenzie.github.io/AsteroidsGame/)   
[Katie](https://kachow4.github.io/AsteroidsGame/)   
[Nghi](https://nagirokudo.github.io/AsteroidsGame/)   
[Bryan](https://bzin22.github.io/AsteroidsGame/)   
[Erica](https://ekwkk.github.io/AsteroidsGame/)   
[Joanna](https://j0annalu.github.io/AsteroidsGame/)   
[Jonathan](https://jonathanchu33.github.io/AsteroidsGame/)   
[Derek](https://keredlew.github.io/AsteroidsGame/)   
[Mi-Kaela](https://mikamarciales.github.io/AsteroidsGame/)   



*This assignment was selected as a "Nifty CS Assignment" in 2008 by Nick Parlante @ Stanford*
