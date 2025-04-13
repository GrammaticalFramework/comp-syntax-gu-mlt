abstract Agreement = {
    cat
        S ;
        CN ;
        V ;
        N ;
        A ;
        Det ;
    fun
        PredVPS : CN -> V -> S ;    -- the black cats run
        DetCN : Det -> CN ;         -- the black cat
        AdjCN : N -> A -> CN ;      -- black cats
}