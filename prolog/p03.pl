% Find the K'th element of a list.
element_at(1,[Result|_],Result).
element_at(Kth,[_|Rest],Result) :- 
    Kth > 1,
    NewKth is Kth - 1,
    element_at(NewKth,Rest,Result).