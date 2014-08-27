flexandbison
============
This code takes up a text file material.json and finds where material is written and the numerals.
To compile the code you need Flex Bison installed on your system. Commands to install them are :- 

sudo apt-get install flex
sudo apt-get install bison

Commands to compile the code

bison -d material.y
flex material.l
g++ material.tab.c lex.yy.c -lfl -o material
./material
