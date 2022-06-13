# finalProject
Group Name: Bozo Project
Group Members: Aiden Li, Joseph Jeon

Summary: Bullet hell-style shooter game, specifically of the fixed shooter type, inspired by games such as Touhou and Undertale, using Processing. A bullet hell is a game where you shoot down enemies while dodging many bullets. A fixed shooter is a bullet hell where everything is constrained to a single screen. 

How to compile: No external libraries used (TBD)
How to run: Open the file using Processing and click the play button

Development Log:

	Aiden
		5/24: Created the player, enemy, boss, and stage class files and instance vars and method temps. Player movement with arrow keys completed, as well as boundaries so that the player doesn't leave the screen.
        5/25: filled something in for the enemy constructor and enemy move.
        5/26: made a fairy subclass of enemy and filled in the shoot and move function to see if the enemy can move and shoot stuff.
        5/27: worked on the spawn method of the stage class so that the stage class manages the enemies on the field and spawns them in when its their turn. filled in the damageable methods in the enemy and made enemies disappear when they die. 
        Created the boss subclass of enemy.
        5/28: Boss phase cycling system, stage spawns in a boss, stage loops (progresses to a new but identical stage) when the boss dies.
        5/29: changed the visuals of the game screen. when the player dies, the game switches to a game over screen and allows you to restart the stage you died on.
        5/30: created a "title screen". The player character moves into the screen instead of just spawning in.
        5/31: fixed the player hitbox.
        6/1: focus mode added; shooting and focus mapped to mouse click.
        6/2: worked on the shooting for the fairy mob enemy
        6/3: edited the color of the player in focus mode; worked on the movement of the fairy; started the first level in stage.
        6/5: new ghost enemy; enemy can now deal damage when touching player; shooting and focus stop when mouse not clicked.
        6/6: fairies can move in different patterns now
        6/7: added move patterns for the fairy and extended the first level
        6/8: tweaks on enemies and extended first level
        6/10: changed the way stages work so that they process through sets of enemies rather than all of them.
        6/11: stages progress with the new phase system; new kama enemy; new stage part preset.
        6/12: varied difficulty (only changes player stats, the laziest kind of varied difficulty). 
        
    
	Joseph
		5/23: Filled out basic information for the README file, and created Game, Bullet, and Phase classes, filling out a few methods. A basic shotgun is able to be fired
		5/24: A basic pattern using the Shotgun class is made. BulletManager moves and displays all bullets, but cannot pool or remove bullets yet
		5/25: Formatting changes; implemented outOfBounds: when a bullet is out of bounds, it is removed from the bulletManager. Also created the Wall class: a class that summons a wall of bullets
		5/26: A basic tick system, a demo for a wall pattern, worked on collisions, worked on bullet duration and damage
		5/27: Player now displays when it is taking damage, and new Boss phase is added: wings (because it looks like wings)
		5/28: PlayerBullet disappears after hitting an enemy
		5/30: Added two new phases: walls and B.S. (Bachelor of Science)

Link to Design Document Google Doc: https://docs.google.com/document/d/1C8VrfNshymGc3sOVWaJeR7DfTx7KVn6Xtgiy1MUR6_M/edit?usp=sharing
