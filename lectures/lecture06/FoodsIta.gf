concrete FoodsIta of Foods = open ParadigmsIta, SyntaxIta, LexiconIta in {
  lincat
    Quality = AP;
    Kind = CN;
    Item = NP ;
    Comment = S ;

  lin 
    Pred item quality = mkS presentTense positivePol (mkCl item quality);
    PredNeg item quality = mkS presentTense negativePol (mkCl item quality);
    That kind = mkNP that_Det kind ;
    Those kind = mkNP those_Det kind ;
    These kind = mkNP these_Det kind ;
    This kind = mkNP this_Det kind ;
    Mod quality kind = mkCN quality kind ;
    Very quality = mkAP very_AdA quality ; 

    Wine = mkCN wine_N; 
    SparklingWine = mkCN (mkA "effervescente") wine_N ; 
    Cheese = mkCN cheese_N ; 
    Fish = mkCN fish_N ; 
    Pizza = mkCN (mkN "pizza") ; 

    Fresh = mkAP (mkA "fresco");
    Warm = mkAP warm_A; 
    Italian = mkAP (mkA "Italiano");
    Expensive = mkAP (mkA "caro");
    Delicious = mkAP (mkA "delizioso");
    Boring = mkAP (mkA "noioso");

}