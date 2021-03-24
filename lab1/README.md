# Lab 1: Grammatical analysis


This lab follows Chapters 1-4 in the course notes. Each part is started after the lecture on the corresponding chapter.
The assignments are submitted via Canvas.

## Chapter 1: explore the parallel UD treebank (PUD)

1. Go to https://universaldependencies.org/ and download Version 2.5 treebanks
2. Look up the Parallel UD treebanks for those 19 languages that have it. They are named e.g. UD_English-PUD/
3. Select a language to compare with English.
4. Make statistics about the frequencies of POS tags and dependency labels in your language compared with English.
  For instance, the top-10 tags/labels and their number of occurrences.
  What does this tell you about the language?
5. Convert 2x2 tree from CoNLL format to graphical tree by hand, on paper.
  Select a short English tree and its translation.
  Then select a long English tree and its translation.
6. Draw word alignments for some non-trivial example in the PUD treebank, on paper.
  Use the same trees as in the previous question.
  What can you say about the syntactic differences between the languages?


## Chapter 2: design the morpological types of the major parts of speech in your selected language

1. It is enough to cover NOUN, ADJ, and VERB.
2. Use a traditional grammar book or a Wikipedia article to identify the inflectional and inherent features.
3. Then use data from PUD to check which morphological features actually occur in the treebank for that language. 

## Chapter 3: UD syntax analysis

Take a bilingual corpus with English and your own language, and annotate with UD.
The UD annotation that you produce manually can be simplified CoNLL, with just the fields

`position word postag head label`

Make sure that each field is exactly one token, so that the whole line has exactly 5 tokens.

This input can be automatically expanded to full CoNLL by adding undescores for the lemma, morphology, and other missing fields, as well as tabs between the fields (if you didn't use tabs already)

`position    word   _    postag   _   _   head   label   _   _`

Example:

`7 world NOUN 4 nmod`

expands to

`7       world   _       NOUN    _       _       4       nmod    _       _`

(Unfortunately, the tabs are not visible in the md output.)

Once you have full CoNLL, you can use for instance the gfud tool to visualize it.

The corpus is given in the file comp-syntax-corpus-english.txt in this directory.
Your task is to
1. write an English CoNLL file analysing this corpus
2. translate the corpus to your language
3. write a CoNLL file analysing your translation


The corpus is a combination of different sources, including the Parallel UD treebank (PUD).
If you want to cheat - or just check your own answer - you can look for those sentences in the official PUD.

The first 12 sentences are POS-tagged, with each word having the form

`word:<POS>`

Hint: you can initialize the task by converting each word or word:<POS> to a simplified CoNLL line with a dummy head (0) and label (dep), with proper position number of course.

Extra: If you want to see the visual trees, you can build the gfud program from

`https://github.com/GrammaticalFramework/gf-ud`

and issue the command

`cat my-file.conllu | ./gfud conll2pdf`

You will need Haskell and GF libraries to build gfud, and LaTeX to show the pdf.




## Chapter 4: phrase structure analysis

1. Construct phrase structure trees for some of the sentences in the corpus used in Chapter 3, both for English and your chosen language.

2. Test the grammar

https://github.com/GrammaticalFramework/gf-ud/blob/master/grammars/English.dbnf

on last week's corpus, both for English and your own language.

3. Modify the grammar to suit your language and test it on some of the UD treebanks by using `gf-ud eval`.


The gf-ud program can be found in executable versions (once gunzipped) in

http://www.grammaticalframework.org/~aarne/software/

The source code of gf-ud can be found in

https://github.com/GrammaticalFramework/gf-ud

It can be built with `make` if you have Haskell and also have built the gf-core libraries:

https://github.com/GrammaticalFramework/gf-core

This will not be needed if you can use one of the ready-made libraries.


