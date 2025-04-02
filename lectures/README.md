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

GF for ARM Mac (M1, M2, M3): https://www.grammaticalframework.org/~aarne/gf-mac.gz

