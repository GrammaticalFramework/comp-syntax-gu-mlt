abstract Agreement = {
    cat
        NP ;
        CN ;
        N ;
        A ;
        Det ;
        
    fun
        DetCN : Det -> CN -> NP ;   -- this black cat
        AdjCN : A -> N -> CN ;      -- black cat
        UseN : N -> CN ;            -- cat

        cat_N : N ;
        house_N : N ;
        black_A : A ;
        big_A : A ;
        -- simplification of pronouns just to make English interesting
        this_Det : Det ;
        these_Det : Det ;
}