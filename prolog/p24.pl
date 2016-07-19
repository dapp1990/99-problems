% Lotto: Draw N different random numbers from the set 1..M.

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
rnd_select23(_,0,[]).
rnd_select23(Ls,N,[El|Rest]) :-
    N > 0,
    N1 is N - 1,
    length(Ls,Lenth),
    random_between(1, Lenth, Random),
    remove_at(El,Ls,Random,Rss),
    rnd_select23(Rss,N1,Rest).

rnd_select(Size,Number,Result) :-
    numlist(1,Number,Choices),
    rnd_select23(Choices,Size,Result).