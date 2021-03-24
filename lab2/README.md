# Lab 2: Multilingual generation and translation

This lab corresponds to Chapters 5 to 9 of the Notes, but follows them only loosely.
Therefore we will structure it according to the exercise sessions
rather than chapters.
The abstract syntax is given in the subdirectory grammars/abstract/

The compulsory lab assignment has two alternatives:

1. Complete MiniLang for your language of choice
2. Complete MicroLang + application (Doctor) for your language of choice

If you want to work on the Mini grammar you can ignore everything about the Micro grammar and just work on the corresponding Mini file instead

## Session 5

1. Design a morphology for the main lexical types (N, A, V) with parameters and a couple of paradigms.
2. Test it by implementing the lexicon in the MicroLang module. You need to define lincat N,A,V,V2 as well as the paradigms in MicroResource.

*To deliver*: the lexicon part of files MicroGrammarX.gf and MicroResourceX.gf for your language of choice X. Follow the structure of MicroGrammarEng and MicroResourceEng when preparing these.

## Session 6

1. Define the linearization types of main phrasal categories - the remaining categories in MicroLang.
2. Define the rest of the linearization rules in MicroLang.

*To deliver*: MicroLangX and MicroResourceX for your language of choice, with the lexicon part from Session 5 completed with syntax part. 

## Session 7

1. Complete the rest of the definitions of RGL categories and functions in MiniGrammar.
2. Add concrete UD labels.
3. Generate a synthetic UD treebank. The simplest way to do this from the
GF shell is random generation; change english/MiniLangEng.labels to
the labels of your own language:

gr -cat=Utt -number=22 -depth=6 | vd -output=conll
-abslabels=abstract/MiniLang.labels -cnclabels=english/MiniLangEng.labels

*Hint*: if your language is already in the standard RGL, you can implement it easily by making a copy of the files in grammar/swedish.
But use this implementation only as a reference with which to test your own one: your lab submission must not make any use of the RGL modules, except Prelude!

*To deliver* (but only if you select this assignment): file Mini..X.gf for your language X, together with MiniLangX.labels and a treebank in CoNLL format with 20 trees.

*Deadline*: until the end of the course.

## Session 8

1. Implement a simple application grammar, application/Doctor.gf.
This can be be done either by using your own MiniResource or the standard resource.
There are two versions of English implementation to support this.
Your first approximation can be just to copy it and change the words.

*To deliver* (but only if you select this assignment): file DoctorX.gf for your language X.

*Deadline*: until the end of the course.
