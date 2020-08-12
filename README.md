# Dreams GameJamGame
<img src="https://repository-images.githubusercontent.com/280845055/41a8b280-dbc0-11ea-892f-60860a16aac7" alt="Dreams-SceenShot-1" width="500"/>

[Dreams](zacky2456.itch.io/dreams) is a game I ([@Zacky2456](https://github.com/Zacky2456)) and [@Dking08](https://github.com/Dking08) worked on as a submission to the [I Can't Write But I want to tell a story Game Jam](https://itch.io/jam/i-cant-write-but-want-to-tell-a-story/)
The Game is basically a Platformer Game, in which you look for Memories in your protagonist's **Dreams**

This repository contains the source code for the whole game.
if you would like to mess around with the code of the game or edit the levels of this game, below are the instructions to do so

## How to Setup the Game Project so that you can Edit it in GameMaker: Studio 1.x or GameMaker Studio 2 (The trial version is enough to be able to edit this project)

The Game is made in GameMaker: Studio 1.2, so you can edit the project in both GM:S 1.x and GM S2

* Clone The repository! (Basically means downloading the code to you new githubers)
* Make sure to rename the folder containing this code "Dreams.gmx" if you are using GameMaker: Studio 1.x
* Open GM:S 1.x and simply open this project, the Config folder is not included in this repository, so if GameMaker asks you to create its own Config Folder, then just say OK.
* In GameMaker Studio 2, you will have to use the "import project" option to import this code, since this code is of an older version of GM:S.
* You're done, if you have any local importing problems just make an issue.
    
### The room Editor

In case you are doing this to create your own levels, like you can see below: 

<img src="https://cdn.discordapp.com/attachments/708599347733856286/742984879033155604/drem.JPG" alt="Dreams-SceenShot-2" width="700"/>

The Levels in the room editor will actually look something like this:

<img src="https://cdn.discordapp.com/attachments/708599347733856286/742986523942584441/drem2.JPG" alt="Dreams-SceenShot-3" width="700"/>

So, in case you want to edit these levels here is a quick summary of what objects correspond to what tile in the map:
* Object named `obj_floor` is the object you can place in the room which is the actuall floor tile, it will automatically autotile to either Grass tile or Dirt tile depending on where it is, in short, its just the tile you wanna use when making cieling, floor, walls, etc.
* Object named `obj_spikes` is the object which you can place in the map and it will kill the player instantly on contact.
* Object named `obj_invisible_spikes` is the object you put below pits, its just like `obj_spikes` but it will be invisible. Don't place these in levels! this is only for placing outside the room!
* Object named `obj_room` is like the camera, one you are done making your level, place this object above your whole design, and as the player comes in the room, the camera will focus in this very object, see how we have used it in our own designs to give you an instant idea of what it does.
* Object named `obj_cam` controls which `obj_room` to focus
* Object named `obj_icicle` is an ice spike which you can place on cielings and it will drop on player as the player comes below it.
* Object named `obj_player` is the actuall player, Don't try to put multiple of these in a single room because I don't know what issues that will cause.
* Object named `obj_game` is the mendatory object you place in every room, no questions asked.
* Object named `obj_spring` is just a spring which makes the player bounce up in the air
* Object named `obj_true_fade` is the object which controls the fade in fade out and going to the next room. 
* Object named `obj_crystal` is the object which marks the end of a room, collecting this object will trigger `obj_true_fade` to make the room eventually fade out and go to the next room. Always place a bunch of `obj_floor`s above the Crystal as cieling! the game **will not progress** if the crystal isn't in contact with any `obj_floor` while trying to go to the next room **after** playing the you win music.

And with that knowledge you should be able to safely edit the levels!

<img src="https://cdn.discordapp.com/attachments/708599347733856286/742986526874402816/drem3.JPG" alt="Dreams-SceenShot-4" width="700"/>

## Some End Links
* Zacky2456: https://github.com/Zacky2456
* Dking08: https://github.com/Dking08
* The Game's page: https://zacky2456.itch.io/dreams
* The Game's entry page in the GameJame: https://itch.io/jam/i-cant-write-but-want-to-tell-a-story/rate/727635
* The Game's Github releases: https://github.com/Zacky2456/Dreams-GameJamGame/releases
* GameMaker Studio 2 (The trial version is enough to be able to edit this project): https://www.yoyogames.com/get
