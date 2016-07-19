% Generate the combinations of K distinct objects chosen from the 
% N elements of a list

combine(0,_,[]).
combine(Counter,Candidates,[Candidate|Result]) :-
    Counter > 0,
    Counter1 is Counter - 1,
    get_candidates(Candidate,Candidates,Rest1),
    combine(Counter1,Rest1,Result).
    
get_candidates(Candidate,[Candidate|Rest],Rest).
get_candidates(Candidate,[_|Rest],Rest1) :- 
    get_candidates(Candidate,Rest,Rest1).