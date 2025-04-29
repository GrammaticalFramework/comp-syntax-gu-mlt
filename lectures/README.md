# Computations Syntax Lectures: Outline

## Lecture 1

Coursenotes: Chapter 1

Participants' native languages:
Chinese (2), Dutch, English, Finnish, French (2), Greek, Hebrew, Italian (3),
Korean, Persian (2), Polish, Portuguese, Romanian (3), Russian, Spanish, Swedish (2),
Swiss German, West-Assyrian - 24 students, 17 languages + 2 teachers, 1 more language

Formal grammar is no more expected to match natural language exactly
- analysis: should be wider than the language (we will use UD)
- generation: should be contained in the language (we will use GF)
- in both formats, we aim to use universal concepts for many languages

Phrase structure grammars, context-free = BNF, grammar rules, trees
- example: [english.cf](lecture-01/english.cf)
- testing grammars in GF: import, generate_random, parse, linearize, visualize_parse, help


GF grammars: dividing .cf into abstract and concrete .gf
- example: [Intro*.gf](lecture-01/)
- forms of rules: cat, fun, lincat, lin
- word order switch English-Italian
- to solve next time:

Experiments in GF:
- https://cloud.grammaticalframework.org/minibar/minibar.html
- Grammar: ResourceDemo, Startcat: S


## Lecture 2

Agreement, parameter definitions, variable and inherent features, linearization types

[IntroEng.gf](lecture-02/InfroEng.gf)

For you to do:
- write a concrete syntax for some other language, carefully thinking about


### Instructions for ARM Mac users

The GF Download page contains a binary for the Mac with an Intel processor, but it will not work for newer Macs, which use an ARM Processor (called M1, M2, or M3 by Apple).

We have therefore prepared a binary for these newer Macs.
To download it, open a terminal and do:
```
  cd             # go to your home directory
  mkdir tmp      # if the directory tmp does not exist already
  cd tmp
  wget https://www.grammaticalframework.org/~aarne/gf-mac.gz
```
This is better than downloading via a browser, because your Mac OS may then block the use of the program as "unreliable".

After download, stay in the terminal and do:
```
 gunzip gf-mac.gz
 mv gf-mac gf
 chmod a+x gf
 ./gf
```
You should now see the GF promt. Type 'help' to see if it works!

Hint: if any of the terminal commands used above are unfamiliar to you, it is a good time to learn them now.
They will be useful throughout your future career as a programmer!
The readily available method is the `man` command, for instance,
```
  man gunzip
```

The next thing is to move it to a place where you can find it from anywhere in your system.
One standard place is
```
  mv gf /usr/local/bin
```
If you get "permission denied", you will have to write
```
  sudo mv gf /usr/local/bin
```
and type your computer's password.

Then you can try
```
  cd
  gf
```
to verify that GF works in your home directory.

After that, you can test it in the course GitHub directory
```
  cd comp-syntax-gu-mlt/lectures/lecture-02
  gf
  > import IntroEng.gf   # in GF
```
You can work here for a while.
The next step will be to install the RGL, but this can wait a bit.
The instructions in https://www.grammaticalframework.org/download/index-3.11.html should work even for the ARM Mac.


## Lecture 3

Course notes: Chapter 2, Chapter 5

Analysing UD data with shell commands:
```
cat treebanks/UD_Swedish-Talbanken/sv_talbanken-ud-train.conllu | cut -f4 | grep -v "#" | sort
cat treebanks/UD_Swedish-Talbanken/sv_talbanken-ud-train.conllu | cut -f4 | grep -v "#" | sort -u
cat treebanks/UD_Swedish-Talbanken/sv_talbanken-ud-train.conllu | cut -f4 | grep -v "#" | sort -u | wc
```
Again, make sure to learn to use these shell commands!

Adding deptreepy to the pipeline:
```
cat treebanks/UD_English-EWT/en_ewt-ud-train.conllu | ./deptreepy.py "statistics POS"
cat treebanks/UD_English-EWT/en_ewt-ud-train.conllu | ./deptreepy.py "match_wordlines (POS X)"
cat treebanks/UD_English-EWT/en_ewt-ud-train.conllu | ./deptreepy.py "statistics FEATS"
cat treebanks/UD_English-EWT/en_ewt-ud-train.conllu | ./deptreepy.py "match_wordlines (POS NOUN) | statistics FEATS"
```
Download deptreepy and the UD treebanks, and do the same for other treebanks of other languages!

Confirmed Swedish inflection table by looking up a word at https://svenska.se/ and also learn what is inherent and what is variable.

Started MorphologyEng.gf and MorphologySwe.gf in lecture-03/.


## Lecture 7

We took a look at the RGL synopsis, https://www.grammaticalframework.org/lib/doc/synopsis/

We focused on a few things:
- the hierarchic view of categories (Chapter 1)
- Sentence/Clause distinction, looking at "inflection tables" of clauses in https://cloud.grammaticalframework.org/minibar/minibar.html (ResourceDemo, startcat Cl)
- verb valencies: V, V2, V3, VA, VV, etc and the "sense distinctions" that come with different valency patterns and also typically are translated with different words

An examples of verb valencies, "look":
- V: look ; titta
- V2: look at ; titta på 
- V2: look for ; leta efter
- V2: look after ; ta hand om
- V2 : look like ; se ut som
- V3 : look up ; slå upp
- VA: look (good) ; se (bra) ut

We also briefly discussed complements vs. adjuncts and pointed out that they can be difficult to distinguish and that UD does not even try.


## Lecture 8

Installing RGL: a binary release can be found in

https://github.com/GrammaticalFramework/gf-rgl/releases/tag/20250429

Steps:
1. Download rgl-20250429.tgz
2. Put it into some good place, for instance ~/GF or /usr/local/lib
3. Uncompress it with `tar xvfz`
4. The top directory created is lib, with subdirectories alltenses, prelude, present. List them to see lots of .gfo files
5. Export the absolute path to this lib as the value of the environment variable `GF_LIB_PATH`, which GF recognizes: `export GF_LIB_PATH=/Users/aarne/GF/lib` if this is where you have placed it.
6. This export command can also be attached you your .bashrc or .zprofile, or whatever shell initialization file you have

When you have done this, you can test if it works in the following way:
```
 $ gf
 > i alltenses/LangEng.gfo
 > gr -cat=Cl | l -table
```
We also looked at the source of the RGL, obtained by cloning https://github.com/GrammaticalFramework/gf-rgl
The binaries can be compiled from this, if you need a Haskell compiler.
If you don't have one, you can still keep the sources just for documentation.
They can be imported in the GF program, but compiling the whole RGL is easier if you use `make install`, which requires Haskell.



