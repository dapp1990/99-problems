% Generate a random permutation of the elements of a list.

%P20
remove_at(El,List,Remove,Rest) :- remove_at(El,List,Remove,[],Rest).

remove_at(El,[El|Rest],1,Acc,Result) :- 
    reverse(Acc,Acc1),
    append(Acc1,Rest,Result).
remove_at(El,[X|Rest],Remove,Acc,Result) :-
    Remove > 1,
    Remove1 is Remove - 1,
    remove_at(El,Rest,Remove1,[X|Acc],Result).

%P23
rnd_select(_,0,[]).
rnd_select(Ls,N,[El|Rest]) :-
    N > 0,
    N1 is N - 1,
    length(Ls,Lenth),
	random_between(1, Lenth, Random),
    remove_at(El,Ls,Random,Rss),
    rnd_select(Rss,N1,Rest).

rnd_permu(List,Result) :-
    length(List,Length),
    rnd_select(List,Length,Result).