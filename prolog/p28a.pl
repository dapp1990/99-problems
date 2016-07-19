% Sorting a list of lists according to length of sublists
% We suppose that a list (InList) contains elements that are 
% lists themselves. The objective is to sort the elements of 
% InList according to their length. E.g. short lists first, 
% longer lists later, or vice versa.

divide([],[]).
divide([X|Xs],[[X]|Ys]) :- divide(Xs,Ys).

select([X],X) :- is_list(X).
select([X,Y|Rest],Result) :-
    merge_sort(X,Y,Sorted),
    append(Rest,[Sorted],SemiSorted),
    select(SemiSorted,Result).

merge_sort([],Sorted,Sorted).
merge_sort(Sorted,[],Sorted).
merge_sort([X|XRest],[Y|YRest],Result) :-
    length(X,Xlength),
	length(Y,Ylength),
    ( Xlength > Ylength ->
    	merge_sort([X|XRest],YRest,Result1),
    	append([Y],Result1,Result)
    ;   
    	merge_sort(XRest,[Y|YRest],Result1),
    	append([X],Result1,Result)
    ).

lsort(Unsorted,Sorted) :-
	divide(Unsorted,Unsorted1),
   	select(Unsorted1,Sorted).