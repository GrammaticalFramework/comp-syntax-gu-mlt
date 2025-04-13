concrete AgreementSwe of Agreement = open MorphologySwe in {
    lincat
        NP = {s: Case => Str; a: NPAgreement} ;
        CN = Noun ;
        N = Noun ;
        A = Adjective ;
        Det = {s: Gender => Str; n : Number} ;
    
    lin
        DetCN d cn = {
            s = \\c => (d.s ! cn.g) ++ (cn.s ! (NF d.n Def Nom)) ;
            a = NPAgr d.n cn.g Def
        } ;
        AdjCN a cn = {
            s = \\f => 
                let agr = NPAgr (nform2number f) cn.g (nform2definite f) 
                in (a.s ! agr) ++ (cn.s ! f) ;
            g = cn.g } ;
        UseN n = n ;

        cat_N = mk4Noun "katt" "katten" "katter" "katterna" ;
        black_A = mkAdjective "svart" "svart" "svarta" ;
        the_Sg = {
            s = table {Com => "den" ; Neut => "det"} ; 
            n = Sg} ;
        the_Pl = {
            s = table {Com => "de" ; Neut => "de"} ; 
            n = Pl} ;
}