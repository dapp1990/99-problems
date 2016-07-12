% Eliminate consecutive duplicates of list elements.
% If a list contains repeated elements they should be 
% replaced with a single copy of the element. The order 
% of the elements should not be changed.

compress(List,Result) :- compress(List,_,Result).

compress([],_,[]).
compress([E1|Rest],Current,Result) :-
    (   E1 == Current ->  
        compress(Rest,Current,Result2),
        append([],Result2,Result)
    ;  
        compress(Rest,E1,Result2),
        append([E1],Result2,Result)
    ).