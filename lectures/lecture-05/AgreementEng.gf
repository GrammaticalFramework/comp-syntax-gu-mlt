concrete AgreementEng of Agreement = open MorphologyEng in {
    lincat
        NP = {s: Str; n: Number} ;
        CN = Noun ;
        N = Noun ;
        A = {s: Str} ;
        Det = {s: Str; n : Number} ;
    
    lin
        DetCN d cn = {
            s = d.s ++ (cn.s ! d.n) ;
            n = d.n } ;
        AdjCN a cn = {s = \\n => a.s ++ (cn.s ! n) } ;
        UseN n = n ;

        cat_N = regNoun "cat" ;
        black_A = {s = "black"} ;
        the_Sg = {s = "the"; n = Sg} ;
        the_Pl = {s = "the"; n = Pl} ;
}