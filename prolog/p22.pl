% Create a list containing all integers within a given range.
% without using numlist predicate

range(Max,Max,[Max]).
range(Min,Max,Result) :- 
    Min < Max,
    Min1 is Min + 1,
    range(Min1,Max,L),
    append([Min],L,Result).