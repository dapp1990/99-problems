% Determine whether a given integer number is prime.
is_prime(Number) :- is_prime(Number,2).

is_prime(Number,Number).
is_prime(Number,Counter) :-
    Counter < Number,
    X is Number mod Counter,
    ( X \= 0 ->  
    	Counter1 is Counter + 1,
    	prime(Number,Counter1)
    ;   
    	false
    ).