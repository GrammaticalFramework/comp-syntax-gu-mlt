concrete AgreementSwe of Agreement = open MorphologySwe in {
    lincat
        NP = {s: Str; a: NPAgreement} ;
        CN = Noun ;
        N = Noun ;
        A = Adjective ;
        Det = {s : Gender => Str; n: Number; d: Definite} ; -- and possible Definiteness

    lin
       DetCN d cn = {
           s = (d.s ! cn.g) ++ (cn.s ! (NF d.n d.d Nom)) ;
           a = NPAgr d.n d.d cn.g ; 
       } ;
        AdjCN a n = {
            s = \\nf => let agr = NPAgr (nform2number nf) (nform2definite nf) n.g
                        in (a.s ! agr) ++ (n.s ! nf) ; 
            g = n.g
        } ;
        UseN n = n ;
        
        cat_N = mk4Noun "katt" "katten" "katter" "katterna" ; 
        house_N = mk4Noun "hus" "huset" "hus" "husen" ;
        black_A = mk3Adjective "svart" "svart" "svarta" ;
        big_A = mk3Adjective "stor" "stort" "stora" ;
        this_Det = {
            s = table {
                Com => "den här" ;
                Neut => "det här" 
            } ;
            n = Sg ;
            d = Def ;
        } ;
        these_Det = {
            s = table {
                Com => "de här" ;
                Neut => "de här" 
            };
            n = Pl ;
            d = Def ;
        } ;
    
}