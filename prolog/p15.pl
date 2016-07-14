% Duplicate the elements of a list a given number of times.

dupli([],_,[]).
dupli([El|Rest],X,Result) :- 
    multiply(X,El,Result1),
    dupli(Rest,X,Result2),
    append(Result1,Result2,Result).

multiply(0,_,[]).
multiply(Counter,X,[X|Rest]) :-
    Counter > 0,
    Counter1 is Counter -1,
    multiply(Counter1,X,Rest).