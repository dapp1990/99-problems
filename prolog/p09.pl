% Pack consecutive duplicates of list elements into sublists.
% If a list contains repeated elements they should be placed 
% in separate sublists.

pack([First|Rest],Result) :- pack(Rest,[First],[],Result).

pack([],Last,SubTotal,Result) :-
    append([Last],SubTotal,RR),
    reverse(RR,Result).
pack([E1|Rest],Current,SubResult,Result) :-
    (   member(E1,Current) -> 
	    append([E1],Current,Current2),
        pack(Rest,Current2,SubResult, Result)
    ;  
        append([Current],SubResult,SubResult2),
        pack(Rest,[E1],SubResult2, Result)
    ).