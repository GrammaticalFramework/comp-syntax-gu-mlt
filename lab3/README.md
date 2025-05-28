# Lab 3: Universal Dependencies

This lab is divided into two parts.
In [part 1](#part-1-ud-annotation), you will create a small parallel UD treebank for English/Swedish and a language of your choice.
In [part 2](#part-2-ud-parsing), you will train a parsing model and evaluate it on your treebank.

## Part 1: UD annotation
The goal of this part of the lab is for you to become able to contribute to a UD annotation project. You will familiarize with the CoNNL-U format and annotate your own parallel UD treebank.

### Step 1: familiarize with the CoNLL-U format
Go to [universaldependencies.org](https://universaldependencies.org/) and download a treebank for a language of your choice.
Choose a short (5-10 tokens) and a long (>25 words) sentence and convert it from CoNNL-U to a graphical trees by hand.

### Step 2: choose a corpus
Choose one of the two corpora provided in this folder:

- [`comp-syntax-corpus-english.txt`](comp-syntax-corpus-english.txt) is a combination of __English__ sentences from different sources, including [the Parallel UD treebank (PUD)](https://github.com/UniversalDependencies/UD_English-PUD/tree/master). If you want to cheat - or just check your answers - you can look for them in the official treebank. You can also compare your analyses with those of an automatic parser, such as [UDPipe](https://lindat.mff.cuni.cz/services/udpipe/), which you can try directly in your browser. These automatic analyses must of course be taken with a grain of salt
- [`comp-syntax-corpus-swedish.txt`](comp-syntax-corpus-swedish.txt) consists of teacher-corrected sentences from the [__Swedish__ Learner Language (SweLL) corpus](https://spraakbanken.gu.se/en/resources/swell-gold), which is currently being annotated in UD for the first time. 
In this case, there is no "gold standard" to check your answers against, but you can still compare your solutions with [UDPipe](https://lindat.mff.cuni.cz/services/udpipe/)'s automatic analyses.

In both corpora, the first few sentences are pre-tokenized and POS-tagged. Each token is in the form

`word:<UPOS>`.

### Step 3: annotate
For each sentence in the corpus, the annotation tasks consists in:

1. analyzing the sentence in UD
2. translating it to a language of your choice
3. analyzing your translation

The only required fields are `ID`, `FORM`, `UPOS`, `HEAD` and `DEPREL`.

In the end, you will submit two parallel CoNLL-U files, one containing the analyses of the source sentences and one for the analyses of the translations.

To produce the CoNLL-U files, you may work in your text editor (if you use Visual Studio Code, you can use the [vscode-conllu](https://marketplace.visualstudio.com/items?itemName=lgrobol.vscode-conllu) to get syntax highlighting), use a spreadsheet program and then export to TSV, or use a dedicated graphical annotation tool such as [Arborator](https://arborator.grew.fr/#/).

If you work in your text editor, it might be easier to first write a simplified CoNLL-U, with just the fields `ID`, `FORM`, `UPOS`, `HEAD` and `DEPREL`, separated by tabs, and then expand it to full CoNLL-U with [this script](https://gist.github.com/harisont/612a87d20f729aa3411041f873367fa2) (or similar).

Example:

`7  world NOUN  4 nmod`

expands to

`7  world _ NOUN  _ _ 4 nmod  _ _`

We recommend that you annotate at least the first few sentences from scratch.
When you start feeling confident, you may pre-parse the remaining ones with UDPipe and manually correct the automatic annotation.
If you are unsure about an annotation choice you made, you can add a comment line (starting with `#`) right before the sentence in question.
To fully comply with the CoNLL-U standard, comment lines should consist of key-value pairs, e.g.

```conllu
# comment = your comment here
```

but for this assigment lines like

```
# your comment here
```

are perfectly acceptable too.

### Step 4: make sure your files match the CoNLL-U specification
Once you have full CoNLL, you can use [deptreepy](https://github.com/aarneranta/deptreepy/), [STUnD](https://harisont.github.io/STUnD/) or [the official online CoNNL-U viewer](https://universaldependencies.org/conllu_viewer.html) to visualize it.

With deptreepy, you will need to issue the command

`cat my-file.conllu | python deptreepy.py visualize_conllu > my-file.html`

which creates an HTML file you can open in you web browser.

If you can visualize your trees with any of these tools, that's a very good sign that your file _more or less_ matches the CoNNL-U format!

As a last step, validate your treebank with the official UD validator. 
To do that, clone or download the [UD tools repository](https://github.com/UniversalDependencies/tools), move inside the corresponding folder and run

```
python PATH-TO-YOUR-TREEBANK.conllu --lang=2-LETTER-LANGCODE-FOR-YOUR-LANGUAGE --level=1
```

If you want to check for more subtle errors, you can [go up a few levels](https://harisont.github.io/gfaqs.html#ud-validator).

Submit the two CoNLL-U files on Canvas.

## Part 2: UD parsing
In this part of the lab, you will train and evaluate a UD parsing + POS tagging model.
For better performance, you are strongly encouraged to use the MLTGPU server. 
If you want to install MaChAmp on your own computer, keep in mind that very old and very new Python version are not supported. 
For more information, see [here](https://github.com/machamp-nlp/machamp/issues/42). 

### Step 1: setting up MaChAmp
1. optional, but recommended: create a Python virtual environment with the command
   ```
   python -m venv ENVNAME
   ```
   and activate it with

   `source ENVNAME/bin/activate` (Linux/MacOS), or

   `ENVNAME\Scripts\activate.bat` (Windows)
2. clone [the MaChAmp repository](https://github.com/machamp-nlp/machamp), move inside it and run 
   ```
   pip3 install -r requirements.txt
   ```

### Step 2: preparing the training and development data
Choose a UD treebank for one of the two languages you annotated in [part 1](#part-1-ud-annotation) and download it. 
If you translated the corpus to a language that does not have a UD treebank, download a treebank for a related language (e.g. Italian if you annotated sentences in Sardinian). 

If you are working on MLTGPU, you may choose a large treebank such as [Swedish-Talbanken](https://github.com/UniversalDependencies/UD_Swedish-Talbanken), which is already divided into a training, development and test split. 

If you are working on your laptop and/or if your language does not have a lot of data available, you may want to use a smaller treebank, such as [Amharic-ATT](https://github.com/UniversalDependencies/UD_Amharic-ATT), which only comes with a test set. 
In this case, split the test into a training and a development portion (e.g. 80% of the sentences for training and 20% for development).
Make sure both files end with an empty line.

To ensure that MaChAmp works correctly, preprocess __all__ of your data (including your own test data) by running 

```
python scripts/misc/cleanconl.py PATH-TO-A-DATASET-SPLIT
```

This replaces the contents of your input file with a "cleaned up" version of the same treebank.

### Step 3: training
Copy `compsyn.json` to `machamp/configs` and replace the traning and development data paths with the paths to the files you selected/created in step 2.

You can now train your model by running

```
python3 train.py --dataset_configs configs/compsyn.json --device N
```
from the MaChAmp folder.
If you are working on MLTGPU, replace `N` with `0` (GPU). If you are using your laptop or EDUSERV, replace it with `-1`, which instructs MaChAmp to train the model on the CPU.

Everything you see on screen at this stage will be saved in a training log file called `logs/compsyn/DATE/log.txt`.

### Step 4: evaluation
Run your newly trained model with

```
python predict.py logs/compsyn/DATE/model.pt PATH-TO-YOUR-PART1-TREEBANK predictions/OUTPUT-FILE-NAME.conllu --device N
```

This saves your model's predictions, i.e. the trees produced by your new parser, in `predictions/OUTPUT-FILE-NAME.conllu`. 
You can take a look at this file to get a first impression of how your model performs.

Then, use the `machamp/scripts/misc/conll18_ud_eval.py` script to evaluate the system output against your annotations. You can run it as

```
python scripts/misc/conll18_ud_eval.py PATH-TO-YOUR-PART1-TREEBANK predictions/OUTPUT-FILE-NAME.conllu
```

On Canvas, submit the training logs, the predictions and the output of `conll18_ud_eval.py`, along with a short text summarizing your considerations on the performance of the parser, based on the predictions themselves and on the output of the results of the evaluation.