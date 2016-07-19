% Group the elements of a set into disjoint subsets.
% In how many ways can a group of 9 people work in 3 disjoint 
% subgroups of 2, 3 and 4 persons? Write a predicate that 
% generates all the possibilities via backtracking.

group3(List,G1a,G2a,G3a) :-
    findall([G1s,G2s,G3s],(
    take2(List,G1,Rest),
    take3(Rest,G2,G3),
	sort(G1,G1s),
	sort(G2,G2s),
	sort(G3,G3s)),
            All),
    sort(All,Set),
    member([G1a,G2a,G3a],Set).

take2(List,G1,Rest) :- takeN(List,G1,Rest,2).
take3(List,G1,Rest) :- takeN(List,G1,Rest,3).

takeN(Rest,[],Rest,0).
takeN(List,[X|R1],Rest,Counter) :-
    Counter > 0,
    Counter1 is Counter - 1,
    select(X,List,Rest1),
    takeN(Rest1,R1,Rest,Counter1).