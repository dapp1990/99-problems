% Determine the greatest common divisor of two positive integer
% numbers.
% Use Euclid's algorithm.

:- op(700,xfx,'gcd').

gcd(N,N,N).
gcd(N1,N2,GCD) :-
    N1 \= N2,
	(   N1 > N2 ->  
    	N3 is N1 - N2,
    	gcd(N3,N2,GCD)
    ;   
	    N3 is N2 - N1,
        gcd(N3,N1,GCD)
    ).
    