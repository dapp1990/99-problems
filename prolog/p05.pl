% Reverse a list.
myReverse([],[]).
myReverse([First|Rest],Result) :- 
    myReverse(Rest,Result2),
	append(Result2,[First],Result).