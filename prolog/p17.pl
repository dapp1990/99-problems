% Split a list into two parts; the length of the first part is given.
% Do not use any predefined predicates.

split(List,0,[],List).
split([El|Rest],Splitter,[El|Rest1],Part2) :- 
    Splitter > 0,
    Splitter1 is Splitter -1,
    split(Rest,Splitter1,Rest1,Part2).