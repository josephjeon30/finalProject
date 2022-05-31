# finalProject
Group Name: Bozo Project
Group Members: Aiden Li, Joseph Jeon

Summary: Bullet hell-style shooter game, specifically of the fixed shooter type, inspired by games such as Touhou and Undertale, using Processing. A bullet hell is a game where you shoot down enemies while dodging many bullets. A fixed shooter is a bullet hell where everything is constrained to a single screen. 

How to compile: No external libraries used (TBD)
How to run: Open the file using Processing and click the play button

Development Log:

	Aiden
		5/24: Created the player, enemy, boss, and stage class files and instance vars and method temps. Player movement with arrow keys completed, as well as boundaries so that the player doesn't leave the screen.

	Joseph
		5/23: Filled out basic information for the README file, and created Game, Bullet, and Phase classes, filling out a few methods. A basic shotgun is able to be fired
		5/24: A basic pattern using the Shotgun class is made. BulletManager moves and displays all bullets, but cannot pool or remove bullets yet
		5/25: Formatting changes; implemented outOfBounds: when a bullet is out of bounds, it is removed from the bulletManager. Also created the Wall class: a class that summons a wall of bullets
		5/26: A basic tick system, a demo for a wall pattern, worked on collisions, worked on bullet duration and damage
		5/27: Player now displays when it is taking damage, and new Boss phase is added: wings (because it looks like wings)
		5/28: PlayerBullet disappears after hitting an enemy
		5/30: Added two new phases: walls and B.S. (Bachelor of Science)

Link to Design Document Google Doc: https://docs.google.com/document/d/1C8VrfNshymGc3sOVWaJeR7DfTx7KVn6Xtgiy1MUR6_M/edit?usp=sharing
