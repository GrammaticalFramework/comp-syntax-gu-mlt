abstract Agreement = {
    cat
        NP ;
        CN ;
        N ;
        A ;
        Det ;
        
    fun
        DetCN : Det -> CN -> NP ;   -- the black cat
        AdjCN : A -> N -> CN ;      -- black cat
        UseN : N -> CN ;            -- cat

        cat_N : N ;
        black_A : A ;
        the_Sg : Det ;
        the_Pl : Det ;
}