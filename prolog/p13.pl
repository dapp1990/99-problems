% Run-length encoding of a list (direct solution).
% Implement the so-called run-length encoding data compression 
% method directly. I.e. don't explicitly create the sublists 
% containing the duplicates, as in problem P09, but only count 
% them. As in problem P11, simplify the result list by 
% replacing the singleton terms [1,X] by X.

encode_direct([First|Rest],Result) :- 
    encode_direct(Rest,[1,First],[],NoSimplifyResult),
    simplify(NoSimplifyResult,Result).

encode_direct([],Last,SubTotal,Result) :-
    append([Last],SubTotal,RR),
    reverse(RR,Result).
encode_direct([E1|Rest],[Counter,Current],SubResult,Result) :-
    (   E1 == Current ->
    	NewCounter is Counter + 1,
    	encode_direct(Rest,[NewCounter,Current],SubResult,Result)
    ;  
        append([[Counter,Current]],SubResult,SubResult2),
        encode_direct(Rest,[1,E1],SubResult2,Result)
    ).

simplify([],[]).
simplify([[1,X]|Rest],[X|Rest1]) :- simplify(Rest,Rest1).
simplify([[A,X]|Rest],[[A,X]|Rest1]) :- 
    A > 1,
    simplify(Rest,Rest1).