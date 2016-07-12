% Find the number of elements of a list.
counter([],0).
counter([_|Rest],Result) :- 
    counter(Rest,Result2),
    Result is 1 + Result2.