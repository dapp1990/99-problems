% Modified run-length encoding.
% Use the result of problem p09 to 
% implement the so-called run-length 
% encoding data compression method. 
% Consecutive duplicates of elements 
% are encoded as terms [N,E] where N 
% is the number of duplicates of the 
% element E.

% Problem P09
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

% Problem P10
encode(List,Result) :- 
    pack(List,PackedList), 
    helper(PackedList,Result).

helper([],[]).
helper([Xs|Xss],Result) :- 
    length(Xs,Amount),
    last(Xs,X),
    helper(Xss,Results),
    append([[Amount,X]],Results,Result).