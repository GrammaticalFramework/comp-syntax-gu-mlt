# Lab 1: Grammatical analysis


This lab follows Chapters 1-4 in the course notes. Each part is started after the lecture on the corresponding chapter.
The assignments are submitted via Canvas.

## Chapter 1: explore the parallel UD treebank (PUD)

1. Go to [universaldependencies.org](https://universaldependencies.org/) and download Version 2.7+ treebanks
2. Look up the Parallel UD treebanks for those 21 languages that have it. They are named e.g. `UD_English-PUD/`
3. Select a language to compare with English.
4. Make statistics about the frequencies of POS tags and dependency labels in your language compared with English: find the top-20 tags/labels and their number of occurrences. What does this tell you about the language? (This can be done with shell or Python programming or, more easily, with the [deptreepy](https://github.com/aarneranta/deptreepy/) or [gf-ud](https://github.com/grammaticalFramework/gf-ud) tools. The latter is also available on the eduserv server.) 
5. Convert the following four trees from CoNLL-U format to graphical trees by hand, on paper.
   - a short English tree (5-10 words, of your choice) and its translation.
   - a long English tree (>25 words) and its translation.
1. Draw word alignments for some non-trivial example in the PUD treebank, on paper.
  Use the same trees as in the previous question.
  What can you say about the syntactic differences between the languages?


## Chapter 2: design the morpological types of the major parts of speech in your selected language

1. It is enough to cover NOUN, ADJ, and VERB.
2. Use a traditional grammar book or a Wikipedia article to identify the inflectional and inherent features.
3. Then use data from PUD to check which morphological features actually occur in the treebank for that language. 

## Chapter 3: UD syntax analysis

In this lab, you will annotate a bilingual corpus with UD.
You can choose between starting with an English corpus and translate it to a language of your choice, or start with a Swedish corpus to translate into English.

Your task is to:

1. write an CoNLL file analysing your chosen corpus
2. translate it
3. write a CoNLL file analysing your translation

### Option 1: English data
The English text is given in the file [`comp-syntax-corpus-english.txt`](comp-syntax-corpus-english.txt) in this directory.
The corpus is a combination of different sources, including the Parallel UD treebank (PUD).
If you want to cheat - or just check your own answer - you can look for those sentences in the official PUD. You can also compare your analyses with those of an automatic parser, such as [UDPipe](https://lindat.mff.cuni.cz/services/udpipe/), which you can try directly from your browser. These automatic analyses must of course be taken with a grain of salt.

### Option 2: Swedish data
The Swedish text is given in the file [`comp-syntax-corpus-swedish.txt`](comp-syntax-corpus-swedish.txt) in this directory.
It consists of teacher-corrected sentences from the [Swedish Learner Language (SweLL) corpus](https://spraakbanken.gu.se/en/resources/swell-gold), which is currently being annotated in UD for the first time. 
In this case, there is no "gold standard" to check your answers against, but by choosing this corpus you will directly contribute to an ongoing annotation project. '
Of course, you can still compare your solutions with [UDPipe](https://lindat.mff.cuni.cz/services/udpipe/)'s automatic analyses.

In both corpora, the first few sentences are POS-tagged, with each word having the form

`word:<POS>`

Hint: you can initialize the task by converting each word or word:<POS> to a simplified CoNLL line with a dummy head (0) and label (dep), with proper position number of course.

The UD annotation that you produce manually can be simplified CoNLL, with just the fields

`position word postag head label`

Make sure that each field is exactly one token, so that the whole line has exactly 5 tokens.

This input can be automatically expanded to full CoNLL by adding undescores for the lemma, morphology, and other missing fields, as well as tabs between the fields (if you didn't use tabs already).

`position    word   _    postag   _   _   head   label   _   _`

Example:

`7 world NOUN 4 nmod`

expands to

`7       world   _       NOUN    _       _       4       nmod    _       _`

(Unfortunately, the tabs are not visible in the md output.)
The conversion to full CoNLL can be done using Python or `gf-ud reduced2conll` (available on eduserv) or with [this script](https://gist.github.com/harisont/612a87d20f729aa3411041f873367fa2).

Once you have full CoNLL, you can use [deptreepy](https://github.com/aarneranta/deptreepy/), [gf-ud](https://github.com/grammaticalFramework/gf-ud) or [the online CoNNL-U viewer](https://universaldependencies.org/conllu_viewer.html) to visualize it.

With deptreepy, you will need to issue the command

`cat my-file.conllu | python deptreepy.py visualize_conllu > my-file.html`

which creates an HTML file you can open in you web browser.

If you use the gf-ud tool, the command is

`cat my-file.conllu | ./gf-ud conll2pdf`

which generates a PDF. However, this does not support all foreign characters.

(It is possible that you won't be able to visualize the trees directly on eduserv.
Building gf-ud and running this command on your machine requires Haskell and the GF libraries, as well as LaTeX to show the pdf output.)

## (Chapter 4: phrase structure analysis)

> __NOTE:__ chapter 4 is __not__ required in the 2024 edition of the course. 
> You are of course welcome to try out these exercises, but they will not be graded.

### Prerequisites: get `gf-ud` to work
There are multiple ways to use `gf-ud`:
- using the version that is installed on eduserv
- installing a pre-compiled executable, available for Mac and Ubuntu machines at http://www.grammaticalframework.org/~aarne/software/
- compiling the source code, available at https://github.com/GrammaticalFramework/gf-ud. `gf-ud` can be built:
  - with `make` provided that you have the GHC Haskell compiler and the gf-core libraries (available at https://github.com/GrammaticalFramework/gf-core) installed 
  - with the Haskell Stack tool, by running `stack install`. This will install all the necessary dependency automatically.

### Tasks
1. Construct (by hand) phrase structure trees for some of the sentences in the corpus used in Chapter 3, both for English and your chosen language. 

2. Test the grammar at

   https://github.com/GrammaticalFramework/gf-ud/blob/master/grammars/English.dbnf

   on last week's corpus, both for English and your own language. 
   In practice, this means:
     - running `gf-ud`'s `dbnf` command on (possibly POS-tagged) versions of the sentences in Chapter 3's corpus.
     - comparing the CoNNL-U and parse trees obtained in this way with, respectively, your hand-drawn parse trees and the CoNNL-U trees from Chapter 3. Parse tree comparison can be qualitative, while CoNNL-U trees are to be compared quantitatively via `gf-ud eval`.

3. Modify the grammar to suit your language and test it on some of the UD treebanks by using `gf-ud eval`. Try to obtain a `udScore` above 0.60. You are welcome to explain the changes you make.
