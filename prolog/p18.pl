% Extract a slice from a list.
% Given two indices, I and K, the slice is the list 
% containing the elements between the I'th and K'th element 
% of the original list (both limits included). Start 
% counting the elements with 1.

slice(List,LowBound,UpperBound,Result) :- 
    Max is UpperBound + 1 ,
    slice(List,LowBound,Max,1,Result).

slice(_,_,Max,Max,[]).
slice([El|Rest],Min,Max,Counter,[El|Rest1]) :-
    Counter < Max,
    Counter >= Min,
    Counter1 is Counter + 1,
	slice(Rest,Min,Max,Counter1,Rest1).
slice([_|Rest],Min,Max,Counter,Rest1) :-
    Counter < Min,
    Counter1 is Counter + 1,
	slice(Rest,Min,Max,Counter1,Rest1).