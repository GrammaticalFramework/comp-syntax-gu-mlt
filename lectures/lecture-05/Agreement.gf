abstract Agreement = {
    cat
        S ;
        CN ;
        V ;
        N ;
        A ;
        Det ;
    fun
        PredVPS : CN -> V -> S ;    -- the black cat runs
        DetCN : Det -> N -> CN ;    -- the black cat
        AdjCN : A -> N -> CN ;      -- black cat
        UseN : N -> CN ;            -- cat

        cat_N : N ;
        black_A : A ;
        run_V : V ;
        the_Sg : Det ;
        the_Pl : Det ;
}