-- (c) 2009 Aarne Ranta under LGPL
-- in https://github.com/GrammaticalFramework/gf-contrib/blob/master/foods/Foods.gf
--
-- modified for the Computational Syntax course in 2021

abstract Foods = {

  flags startcat = Comment ;
  
  cat
    Comment ;  -- this Italian pizza is very warm
    Item ;     -- this Italian pizza
    Kind ;     -- Italian pizza
    Quality ;  -- very warm
    
  fun
    Pred : Item -> Quality -> Comment ;       -- (this pizza) is (very warm)
    PredNeg : Item -> Quality -> Comment ;    -- (this pizza) is not (very warm)
    This, That, These, Those : Kind -> Item ; -- this|that|these|those (pizza|pizzas) 
    Mod : Quality -> Kind -> Kind ;           -- (Italian) (pizza)
    Very : Quality -> Quality ;               -- very (Italian)

    Wine, Cheese, Fish, Pizza : Kind ;

    Fresh, Warm, Italian, 
      Expensive, Delicious, Boring : Quality ;
}
