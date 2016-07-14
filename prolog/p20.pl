% Remove the K'th element from a list.

remove_at(El,List,Remove,Rest) :- remove_at(El,List,Remove,[],Rest).

remove_at(El,[El|Rest],1,Acc,Result) :- 
    reverse(Acc,Acc1),
    append(Acc1,Rest,Result).
remove_at(El,[X|Rest],Remove,Acc,Result) :-
    Remove > 1,
    Remove1 is Remove - 1,
    remove_at(El,Rest,Remove1,[X|Acc],Result).