# Lab 1: Multilingual generation and translation

In this lab, you will implement the concrete syntax of a grammar for a language of your choice. 
The abstract syntax is given in the directory [`grammar/abstract/`](grammar/abstract/) and an example concrete syntax for English can be found in [`grammar/english/`](grammar/english/).

You will need to install:

- GF core and the RGL (see installation instructions [here](https://www.grammaticalframework.org/download/index-3.11.html)) 
- the [language server for GF](https://github.com/anka-213/gf-lsp)

## Part 1: setup and lexicon
1. Create a subfolder in [`grammar/`](grammar/) for your language of choice
2. Copy the contents of [`grammar/english/`](grammar/english/) to your new folder and apply the necessary renamings (i.e. replace all occurrences of `Eng` with the new language code)
3. Translate the words in lexicon part of `MicroLangXxx`
4. Test your new concrete syntax by generating a few random trees in the GF interpreter. When you linearize them, you should see sentences in a mixture of English and your chosen language. To do this you can use the commands
     - `i MicroLangXxx.gf` to [import](https://www.grammaticalframework.org/doc/gf-shell-reference.html#toc18) the grammar
     - `gr | l` to [generate a random tree](https://www.grammaticalframework.org/doc/gf-shell-reference.html#toc15) and [linearize](https://www.grammaticalframework.org/doc/gf-shell-reference.html#toc19) it

## Part 2: morphology
1. Design the morphological types of the major parts of speech (NOUN, ADJ, and VERB) in your selected language, i.e. identify their inflectional and inherent features using: a traditional grammar book or a Wikipedia article __and/or__ data from [universaldependencies.org](https://universaldependencies.org/). In the latter case:
     1. download a treebank for your language
     2. use [deptreepy](https://github.com/aarneranta/deptreepy/) or write your own script to query the treebank and look up what morphological features actually occur in the data for each POS
2. Implement these in GF by defining parameters and writing a couple of paradigms. In this phase, you will work in the `MicroResXxx` module
3. Test your GF morphology. To do that, you can import the grammar with the `-retain` flag and use the [`compute_concrete`](https://www.grammaticalframework.org/doc/gf-shell-reference.html#toc8) command on the various lexical items. For example `cc star_N` returns the full inflectional table for the noun "star"

## Part 3: syntax
1. Define the linearization types of main phrasal categories - the remaining categories in `MicroLang`.
2. Define the rest of the linearization rules in `MicroLang`.

## Part 4: testing your grammar against the RGL
Since `MicroLang` is a proper part of the RGL, it can be easily implemented as an application grammar.
How to do this is shown in `grammar/functor/`, where the implementation consists of two files:
- `MicroLangFunctor.gf` which is a generic implementation working for all RGL languages,
- `MicroLangFunctorEng.gf` which is a *functor instantiation* for English, easily reproducible for other languages than `Eng`.

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

The Mini grammar can be tested in the same way, by building a reference implementation using the functor in `functor/`.'

---

Submit `MicroLangXxx.gf` and `MicroResXxx.gf` on Canvas.
