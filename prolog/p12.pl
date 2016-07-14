% Decode a run-length encoded list.
% Given a run-length code list generated as specified
% in problem P11. Construct its uncompressed version.

decode([],[]).
decode([X|Rest],[X|Rest1]) :-
    \+ is_list(X),
    decode(Rest, Rest1).
decode([[Amount,X]|Rest],Result) :-
    decode(Rest,Result1),
    expand(Amount,X,List),
    append(List,Result1,Result).

expand(0,_,[]).
expand(Amount,X,[X|Rest]) :-
    Amount > 0,
    Amount1 is Amount-1,
    expand(Amount1,X,Rest).