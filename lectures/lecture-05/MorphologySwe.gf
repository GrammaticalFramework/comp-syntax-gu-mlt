resource MorphologySwe = {

param
  Case = Nom | Gen ;
  Definite = Ind | Def ;
  Gender = Com | Neut ;
  Number = Sg | Pl ;

  NForm = NF Number Definite Case ; -- NF is a constructor
  NPAgreement = NPAgr Number Gender Definite ;

oper
  nform2number : NForm -> Number = \f -> case f of {
    (NF n _ _) => n
  } ;

  nform2definite : NForm -> Definite = \f -> case f of {
    (NF _ d _) => d
  } ;

--  Noun = {s : Number => Definite => Case => Str ; g : Gender} ;
  Noun = {s : NForm => Str ; g : Gender} ;

  Adjective = {s : NPAgreement => Str};

  mkNoun : (sin, sig, sdn, sdg, pin, pig, pdn, pdg : Str) -> Gender -> Noun =
    \sin, sig, sdn, sdg, pin, pig, pdn, pdg, g -> {
      s = table {
        NF Sg Ind Nom => sin ;
        NF Sg Ind Gen => sig ;
        NF Sg Def Nom => sdn ;
        NF Sg Def Gen => sdg ;
        NF Pl Ind Nom => pin ;
        NF Pl Ind Gen => pig ;
        NF Pl Def Nom => pdn ;
        NF Pl Def Gen => pdg
	} ;
      g = g
      } ;
  
  mkAdjective : (stor, stort, stora : Str) -> Adjective =
    \stor, stort, stora -> {
      s = table {
        NPAgr Sg Com Ind => stor ;
        NPAgr Sg Com Def => stora ;
        NPAgr Sg Neut Ind => stort ;
        NPAgr Sg Neut Def => stora ;
        NPAgr Pl Com Ind => stora ;
        NPAgr Pl Com Def => stora ;
        NPAgr Pl Neut Ind => stora ;
        NPAgr Pl Neut Def => stora 
      }
    } ;

  addS : Str -> Str = \s -> case s of {
    _ + ("s" | "x" | "z") => s ;
    _ => s + "s"
    } ;

  mk4Noun : (sin, sdn, pin, pdn : Str) -> Noun =
    \sin, sdn, pin, pdn -> {
      s = table {
        NF Sg Ind Nom => sin ;
        NF Sg Ind Gen => addS sin ;
        NF Sg Def Nom => sdn ;
        NF Sg Def Gen => addS sdn ;
        NF Pl Ind Nom => pin ;
        NF Pl Ind Gen => addS pin ;
        NF Pl Def Nom => pdn ;
        NF Pl Def Gen => addS pdn
	} ;
      g = case sdn of {
        _ + "n" => Com ;
	_ => Neut
	}
      } ;

  smartNoun : Str -> Noun = \mamma -> case mamma of {
    mamm + "a" => mkNoun mamma (mamma + "s") (mamma + "n") (mamma + "ns")
                (mamm + "or") (mamm + "ors") (mamm + "orna") (mamm + "ornas")
		Com ;
    bil => mkNoun bil (bil + "s") (bil + "en") (bil + "ens") 
                (bil + "ar") (bil + "ars") (bil + "arna") (bil + "arnas") Com
    } ;

}