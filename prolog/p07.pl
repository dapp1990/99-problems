% Transform a list, possibly holding lists as elements into a 
% 'flat' list by replacing each list with its elements 
% (recursively).

flatten([],[]).
flatten(Element,[Element]) :- \+ is_list(Element).
flatten([First|Rest],Result) :-
    flatten(First,Result2),
    flatten(Rest,Result3),
    append(Result2,Result3,Result).