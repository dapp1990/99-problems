% Sorting a list of lists according to length of sublists
% Again, we suppose that a list (InList) contains elements 
% that are lists themselves. But this time the objective is 
% to sort the elements of InList according to their length 
% frequency; i.e. in the default, where sorting is done 
% ascendingly, lists with rare lengths are placed first, 
% others with a more frequent length come later.

frenquency(_,[],[]).
frenquency(Length,Elements,Result) :-
    length(Elements,NoEmpty),
    NoEmpty > 0,
    get_number(Length,Elements,0,Result1,Rest),
    Length1 is Length + 1,
    frenquency(Length1,Rest,Result2),
    append([Result1],Result2,Result).

get_number(Length,[],Acc,[Length,Acc],[]).
get_number(Lenght,[X|Rest],Acc,Tuple,Rest1) :- 
    length(X,Lenght),
    Acc1 is Acc + 1,
    get_number(Lenght,Rest,Acc1,Tuple,Rest1).
get_number(Lenght,[X|Rest],Acc,Tuple,[X|Rest1]) :- 
    \+ length(X,Lenght),
    get_number(Lenght,Rest,Acc,Tuple,Rest1).
    

divide([],[]).
divide([X|Xs],[[X]|Ys]) :- divide(Xs,Ys).

select(_,[X],X) :- is_list(X).
select(Frequency,[X,Y|Rest],Result) :-
    merge_sort(Frequency,X,Y,Sorted),
    append(Rest,[Sorted],SemiSorted),
    select(Frequency,SemiSorted,Result).

merge_sort(_,[],Sorted,Sorted).
merge_sort(_,Sorted,[],Sorted).
merge_sort(Frequency,[X|XRest],[Y|YRest],Result) :-
    length(X,Xlength),
    length(Y,Ylength),
    member([Xlength,XFrequency],Frequency),
    member([Ylength,YFrequency],Frequency),
    ( XFrequency > YFrequency ->
        merge_sort(Frequency,[X|XRest],YRest,Result1),
        append([Y],Result1,Result)
    ;   
        merge_sort(Frequency,XRest,[Y|YRest],Result1),
        append([X],Result1,Result)
    ).

lfsort(Unsorted,Sorted) :-
    frenquency(1,Unsorted,Frequency),
    divide(Unsorted,Unsorted1),
    select(Frequency,Unsorted1,Sorted).