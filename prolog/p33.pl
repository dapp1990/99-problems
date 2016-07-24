% Determine whether two positive integer numbers are coprime.
% Two numbers are coprime if their greatest common divisor equals 1.

%Problem P33
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

coprime(N1,N2) :- gcd(N1,N2,1).