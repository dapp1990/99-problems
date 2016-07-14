% Modified run-length encoding.
% Modify the result of problem P10 in such a way that if an
% element has no duplicates it is simply copied into the
% result list. Only elements with duplicates are transferred
% as [N,E] terms.

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

% Problem P11
encode_modified(List,Result) :- 
    pack(List,PackedList), 
    helper(PackedList,ResultP10),
    remove_no_duplicates(ResultP10,Result).

helper([],[]).
helper([Xs|Xss],Result) :- 
    length(Xs,Amount),
    last(Xs,X),
    helper(Xss,Results),
    append([[Amount,X]],Results,Result).

remove_no_duplicates([], []).
remove_no_duplicates([[1,X]|Rest],Result) :-
    remove_no_duplicates(Rest, Result1),
    append([X],Result1, Result).
remove_no_duplicates([[C,X]|Rest],[[C,X]|Result1]) :-
    C > 1,
    remove_no_duplicates(Rest, Result1).
    