# UDPipe: quick instructions

## Download and install

The simplest way to use UDPipe is to install the binaries for UDPipe-1, which exist for several operating systems.
They can be downloaded from

https://github.com/ufal/udpipe/releases/download/v1.3.0/udpipe-1.3.0-bin.zip

When you have downloaded and unzipped this file, you will find the binary for your system in a subdirectory, for instance,
```
udpipe-1.3.0-bin/bin-macos/udpipe
```
is the binary for MacOS.
If you include this directory on your PATH, you can run the command `udpipe` from anywhere.

Running the parser for a language requires a model for that language.
Models can be accessed via

https://lindat.mff.cuni.cz/repository/xmlui/handle/11234/1-3131

This page includes a long list of models and a command to install them all.
If you need only some of them, you can do, for instance,
```
$ wget https://lindat.mff.cuni.cz/repository/xmlui/bitstream/handle/11234/1-3131//english-lines-ud-2.5-191206.udpipe
```

## Running the parser

Assuming that you have the binary `udpipe` and the model `english-lines-ud-2.5-191206.udpipe` on you path, you can parse a single sentence with
```
$ echo "my hovercraft is full of eels" | udpipe --tokenize --tag --parse english-lines-ud-2.5-191206.udpipe
```
The result is a UD tree in the CoNLL-U notation,
```
# newdoc
# newpar
# sent_id = 1
# text = my hovercraft is full of eels
1	my	I	PRON	P1SG-GEN	Number=Sing|Person=1|Poss=Yes|PronType=Prs	nmod:poss	_	_
2	hovercraft	hovercraft	NOUN	SG-NOM	Number=Sing	4	nsubj	_	_
3	is	be	AUX	PRES	Mood=Ind|Number=Sing|Person=3|Tense=Pres|VerbForm=Fin	cop	_	_
4	full	full	ADJ	POS	Degree=Pos	0	root	_	_
5	of	of	ADP	_	_	6	case	_	_
6	eels	eel	NOUN	PL-NOM	Number=Plur	4	nmod	_	SpacesAfter=\n
```
If you also have `gfud` and `pdflatex` on your path, you can pipe the result into `gfud conll2pdf` to see the graphical tree.

As `udpipe` reads standard input, you can read it from a file, such as `lecture3-examples.txt`:
```
$ cat <myfile> | udpipe  --tokenize --tag --parse <model>
```
Notice that sentences in that file must either end with a period or be separated by empty lines, because otherwise the whole file is parsed as one sentence.


## Training a new model

If you have a treebank in the CoNLL-U format, you can use it for training a new model, with
```
$ cat <myfile>.conllu | udpipe --tokenizer none --tagger none --train <myfile>.udpipe
```


