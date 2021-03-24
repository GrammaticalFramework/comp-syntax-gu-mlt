# Examples of embedded GF grammars in Python

The grammars use the Python binding available in

https://github.com/GrammaticalFramework/gf-core

see

`src/runtime/python/` 

for installing the Python module `pgf`, and

`src/runtime/c/`

for the C runtime library that the bindings are based on.
You don't need Haskell to build these.

A general tutorial on the Python bindings can be found in

http://www.grammaticalframework.org/doc/runtime-api.html#python

A guide to GF for Python programmers can be found in

https://daherb.github.io/GF-for-Python-programmers/


## Translator

A minimal translator can be found in

[`minitranslator.py`](./minitranslator.py)

This program reads one line of input and translates it from English to Swedish by using `MiniGrammar.pgf`. Example:
```
$ echo "the cat is black" | python3 minitranslator.py
katten är svart
```
A more general version is in

[`translator.py`](./translator.py)

This program reads input line by line, tokenizes it (by a simple tokenizer), and uses an arbitrary pgf and language codes. Example:
```
$ cat findrawscript.txt | python3 translator.py Draw Fin Eng
# translating with Draw.pgf from DrawFin to DrawEng
draw a small red circle
draw a big yellow square
move the small red circle
remove it
```


## Drawing figures

A minimal drawing program with natural language input can found in

[`minidraw.py`](./minidraw.py)

This program reads one line of input in English and converts it to an action of drawing a circle or a square. Example:
```
$ python3 minidraw.py
draw a circle
```
The result is [this window](./dump-minidraw.png).
The program uses the simple graphics library from

https://mcsp.wartburg.edu/zelle/python/graphics.py

We also presuppose the grammar to be compiled with
`
make draw
`
A more complete version (using the same grammar) is in

[`draw.py`](./draw.py)

This program opens a session where it reads input line by line, in a language specified by a language code. Example:
```
$ python3 draw.py Eng
draw a small red circle
draw a blue square
move it        
move the small red circle
```
The result is [this window](./dump-draw.png).

The grammar, [`Draw.gf`](./Draw.gf), illustrates a few things...


## Answering queries

A minimal query answering program with natural language input can found in

[`miniquery.py`](./miniquery.py)

This program reads one line of input in English and executes a query, which is either asking if a number is prime, or calculating a sum. Examples:
```
$ echo "is 143 prime" | python3 miniquery.py 
False
$ echo "1 + 2 + 3" | python3 miniquery.py 
6
```
We presuppose the grammar to be compiled with
`
make query
`
A more complete version (using the same grammar) is in

[`query.py`](./query.py)

This program uses a large grammar with more predicates, operations, and logical forms such as quantifiers. It still reads just one line of input, but allows the language to be specified by a language code. Example:
```
$ echo "what is the factorial of 12" | python3 query.py Eng 
479001600
$ echo "prime numbers between 200 and 300" | python3 query.py Eng 
[211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293]
WARNING: ambiguous
$ echo "are all prime numbers odd" | python3 query.py Eng 
False
```
The grammar, [`Query.gf`](./Query.gf), illustrates a few things...

