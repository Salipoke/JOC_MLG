Original plugin by FabianLC, improved version by Dark Peace (Bottled Up Studio) made for Dojordin

	How to use ?

1- unzip the .zip in your game's folder
(the path names used in the plugin could change regarding where you put the folder, you'll then have to change the paths so the game knows where are the files (no files are missing))
2- attach the SpriteText.gd script to a ReferenceText node (there's already a pre-made scene if you want)
3- add your fonts to the font variable and add your standart font to the curr_font variable (some fonts are already included)
4- modify the width and height parameters of your fonts (= width and height of your letters)
5- the character set variable is all the characters you font can write IN THE CORRECT ORDER (if in your font, "?" is after "!", you'll write them in that order ! Or else there will be an offset)
6- write !

	How to use commands ?

1- write # where you wanna have a command, all the next characters will be affected by said command.
2- write the letter corresponding to the command : F to change font, C to change color, W or S to animate the text, 0 to remove formatting,...
3- some commands need a parameter : #F_ to use the underline font, #C01 to change to yellow, #C13 to change to rainbow,...
BTW you can add or change all the letters used for the commands.
4- #C00 to go back to the standart color, #N to stop animation, #0 to remove all formatting, #FN to go back to the standart font.

	Known bugs (will be fixed asap):

- letter positionning issues when you use fonts with different width/height in the same text
- since # is used for commands, you cannot write # in your text. The command ## was supposed to fix that but it doesn't work. Use "¬" to write # (and change # to ¬ in "character set" variable)

	Problem ? Contact me ! Write a comment on the Itch.io page !

Nothing appears when I write !
-> Check if "visible character" is on 0, change it to -1 ; Check if the parameters of your font are corrects ; Check if you put your standart font in font["Normal"] and Curr_font ; Check if "character set" is correct
The rainbow doesn't work !
-> write the correct path to your rainbow gradient file in the "rainbow" variable
It's not compatible with .ttf files ?
-> Only texture files but I'll fix that
I'm hungry !
-> eat


