# Lab 2: Multilingual generation and translation

This lab corresponds to Chapters 5 to 9 of the Notes, but follows them only loosely.
Therefore we will structure it according to the exercise sessions
rather than chapters.
The abstract syntax is given in the subdirectory grammars/abstract/

## Session 5

1. Design a morphology for the main lexical types (N, A, V) with parameters and a couple of paradigms.
2. Test it by implementing the lexicon in the MicroLang module. You need to define lincat N,A,V,V2 as well as the paradigms in MicroResource.

*To deliver*: the lexicon part of files MicroGrammarX.gf and MicroResourceX.gf for your language of choice X. Follow the structure of MicroGrammarEng and MicroResourceEng when preparing these.

## Session 6

1. Define the linearization types of main phrasal categories - the remaining categories in MicroLang.
2. Define the rest of the linearization rules in MicroLang.

*To deliver*: MicroLangX and MicroResourceX for your language of choice, with the lexicon part from Session 5 completed with syntax part. 

## Session 7

1. Add concrete UD labels.
2. Generate a synthetic UD treebank by using gfud. 

*To deliver* for your language X, file MicroLangX.labels and a treebank in CoNLL format with 20 trees.

*Deadline*: until the end of the course.

## Session 8

1. Try out the applications in `../python` and read its README carefully.
2. Add a concrete syntax for your language to one of the grammars
in `../python/`, either `Query` or `Draw`.
The simplest way to do this
is first to copy the `Eng` grammar and then to change the words; the
syntax may work well as it is. Even though it can be a bit unnatural,
it should be in a wide sense natural.
3. Compile the grammar with `gf -make Query???.gf` so that your grammar
gets included (the same for `Draw`).
4. Generate phrases in GF by first importing your pgf file and then
   issuing the command `gt | l -treebank`; fix your grammar if it looks
   too bad.
5. Test the corresponding Python application with your language.

*To deliver*: your grammar module.

*Deadline*: 31 May. Demo your grammars (both Micro and this one) at
 the last lecture of the course!

### Alternative from 2022

*If you want to do this instead of the current Session 8, contact Aarne first*

The task is to add a language to the grammar in `wikipedia/`. Mode details coming soon.

More information on the task can be find in
- the lecture notes: https://github.com/aarneranta/NLG-examples/blob/main/doc/gf-nlg.pdf 
- the slides shown on lecture 9: https://docs.google.com/presentation/d/1gQTI_vv6anBCaUCJujGxJZbmZBKuXPN_rRUYRgdvXio/edit?usp=sharing
- the GF Summer School film: https://www.youtube.com/watch?v=gX_y2BqJ0w0&list=PL7VkoRLnYYP6EZngakW7lNNCTjfC93uh0&index=15 


## A method for testing your Micro grammar

Since MicroLang is a proper part of the RGL, it can be easily implemented as an application grammar.
How to do this is shown in `grammar/functor/`, where the implementation consists of two files:
- `MicroLangFunctor.gf` which is a generic implementation working for all RGL languages,
- `MicroLangFunctorEng.gf` which is a *functor instantiation* for English, easily reproduciple for other languages than `Eng`.

To use this for testing, you can take the following steps:

1. Build a functor instantiation for your language by copying `MicroLangFunctorEng.gf` and changing `Eng` in the file name and inside the file to your language code.

2. Use GF to create a testfile by random generation:
```
  $ echo "gr -number=1000 | l -tabtreebank" | gf english/MicroLangEng.gf functor/MicroLangFunctorEng.gf >test.tmp
```

3. Inspect the resulting file `test.tmp`.
But you can also use Unix `cut` to create separate files for the two versions of the grammar and `diff` to compare them:
```
  $ cut -f2 test.tmp >test1.tmp
  $ cut -f3 test.tmp >test2.tmp
  $ diff test1.tmp test2.tmp

  52c52
  < the hot fire teachs her
  ---
  > the hot fire teaches her
  69c69
  < the man teachs the apples
  ---
  > the man teaches the apples
  122c122
  ```
As seen from the result in this case, our implementation has a wrong inflection of the verb "teach".

The Mini grammar can be tested in the same way, by building a reference implementation using the functor in `functor/`.





