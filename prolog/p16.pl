% Drop every N'th element from a list.

drop(List,Nth,Result) :- drop(List,Nth,Nth,Result). 
drop([],_,_,[]).
drop([_|Rest],Nth,1,Result) :- drop(Rest,Nth,Nth,Result).
drop([El|Rest],Nth,Acc,[El|Result]) :- 
    Acc > 1,
    Acc1 is Acc -1,
    drop(Rest,Nth,Acc1,Result).