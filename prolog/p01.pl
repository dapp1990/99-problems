% Find the last element of a list.
myLast([Last],Last).
myLast([_|Rest],Last) :- myLast(Rest,Last).