% Find the last but one element of a list.
penultimate([Penultimate,_],Penultimate).
penultimate([_|Rest],Penultimate) :- penultimate(Rest,Penultimate).