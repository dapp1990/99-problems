% Insert an element at a given position into a list.

insert_at(El,Ls,N,Result) :- insert_at(El,[],Ls,N,Result).

insert_at(El,Left,Right,1,Result) :- 
    append(Left,[El],Subresult),
    append(Subresult,Right,Result).

insert_at(El,Left,[X|Rest],Counter,Result) :- 
    Counter > 1,
    Counter1 is Counter - 1,
    append(Left, [X], Left1),
    insert_at(El,Left1,Rest,Counter1,Result).