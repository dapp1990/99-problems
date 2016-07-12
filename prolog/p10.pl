% Run-length encoding of a list.
% Use the result of problem p09 to 
% implement the so-called run-length 
% encoding data compression method. 
% Consecutive duplicates of elements 
% are encoded as terms [N,E] where N 
% is the number of duplicates of the 
% element E.

encode([First|Rest],Result) :- encode(Rest,[1,First],[],Result).

encode([],Last,SubTotal,Result) :-
    append([Last],SubTotal,RR),
    reverse(RR,Result).
encode([E1|Rest],[Counter,Current],SubResult,Result) :-
    (   E1 == Current ->
    	NewCounter is Counter + 1,
        encode(Rest,[NewCounter,Current],SubResult,Result)
    ;  
        append([[Counter,Current]],SubResult,SubResult2),
        encode(Rest,[1,E1],SubResult2,Result)
    ).