# minimal drawing from natural language input: just draw one square or circle
# presupposes 'gf -make DrawEng.gf'

import pgf
from graphics import *

# we assume this abstract syntax
absmodule = "Draw"

# change this to change input language
langname = absmodule + "Eng"

def execute(command,win):
  "interpret drawCommand; other commands ignored"
  fun,args = command.unpack()

  if fun == "drawCommand":
    obj = shape(args[0])
    obj.draw(win)
  else:
    print("command not available")

    
def shape(obj):
  "draw Shape, ignoring given colour and size in this simple example"
  fun,args = obj.unpack()    
  sh,xx = args[2].unpack()
  
  if sh == "circle_Shape":
    shap = Circle(Point(300,300),200)
  elif sh == "square_Shape":
    shap = Rectangle(Point(200,200),Point(600,600))
  else:
    shap = None
    
  return shap

def main():
  "execute one line of input, quit by second Enter"
  win = GraphWin("GF Draw", 1000, 1000)
  gr  = pgf.readPGF(absmodule + ".pgf")
  eng = gr.languages[langname]
  line = input()
  px = eng.parse(line.lower())
  p,tree = px.__next__()
  execute(tree,win)
  input()

main()


