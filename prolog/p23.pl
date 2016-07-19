% Extract a given number of randomly selected elements from a list.

%P20
remove_at(El,List,Remove,Rest) :- remove_at(El,List,Remove,[],Rest).

remove_at(El,[El|Rest],1,Acc,Result) :- 
    reverse(Acc,Acc1),
    append(Acc1,Rest,Result).
remove_at(El,[X|Rest],Remove,Acc,Result) :-
    Remove > 1,
    Remove1 is Remove - 1,
    remove_at(El,Rest,Remove1,[X|Acc],Result).

rnd_select(_,0,[]).
rnd_select(Ls,N,[El|Rest]) :-
    N > 0,
    N1 is N - 1,
    length(Ls,Lenth),
    random_between(1, Lenth, Random),
    remove_at(El,Ls,Random,Rss),
    rnd_select(Rss,N1,Rest).
    