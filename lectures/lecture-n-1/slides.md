---
title: "The title"
subtitle: "and a possibly very long subtitle"
author: "The Author"
theme: "lucid"
logo: "gu.png"
date: "the date"
institute: "The Institution"
---

# The first section

## The first slide
It just contains some __text__ in _various_ styles ~~in it~~.

## The second slide
A first, multiline paragraph with some random words and even a correctly placed footnote![^1]

And a second, shorter paragraph here.

[^1]: This is the footnote.

## Some nested bullet points
- one
- two
  - one
    - one
    - two
    - three
  - two 
  - three
- three

## And a nested numbered list
1. one
2. two
   1. one
      1. one
      2. two
      3. three
   2. two
   3. three
3. three

## Another text slide

Where the text

### Is followed by a colorful subheading

And some more text that doesn't say anything particularly interesting.

## A quote
Introduced by some text, here are

> Some words of wisdom

And a closing comment.

# The fancy section

## An image
![With a caption](sbx.png)

## Some code

A syntax-highlighted code example: 

```haskell
haskellExample :: From -> To
haskellExample from = to
```

Plus some `inline monospaced text` just because we can.

## A little bit of math mode
Here is a pretty random formula:

$\int_{a}^{b} f(x)dx = F(b) - F(a)$

With equal spacing above and below, _obviously_.

## And finally, a table

As always, a very realistic example:

| __col a__ | __col b__ | __col c__ |
| --- | --- | --- |
| a1 | b1 | c1 |
| a2 | b2 | c2 |

# That's all!