% Rotate a list N places to the left.

rotate(List,0,List).
rotate(List,Rotator,Result) :- rotate(List,Rotator,[],Result).

rotate([El|Rest],1,Acc,Result) :- 
    reverse([El|Acc],Acc1),
    append(Rest,Acc1,Result).
rotate(List,-1,Acc,Result) :- 
    last_remove(List,Last,Rest),
    append([Last|Acc],Rest,Result).
rotate([El|Rest],Rotator,Acc,Result) :- 
    Rotator > 1,
    Rotator1 is Rotator - 1,
    rotate(Rest,Rotator1,[El|Acc],Result).
rotate(List,Rotator,Acc,Result) :- 
    Rotator < -1,
    last_remove(List,Last,Rest),
    Rotator1 is Rotator + 1,
    rotate(Rest,Rotator1,[Last|Acc],Result).

last_remove([Last],Last,[]).
last_remove([X|Rest],Last,[X|Rest1]) :- last_remove(Rest,Last,Rest1).