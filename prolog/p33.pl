% Calculate Euler's totient function phi(m).
% Two numbers are coprime if their greatest common divisor equals 1.

%Problem P33
:- op(500,fx,totient_phi).
:- op(100,xfx,'gcd').

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

totient_phi(1,1).
totient_phi(Number,Phi) :- 
    Number > 1,
    totient_phi_3(Number,1,Phi).

totient_phi_3(Num,Num,0).
totient_phi_3(Num,Counter,Phi) :-
    Num > Counter,
	(   coprime(Num,Counter) ->
	    Phi2 is 1
	    ;   
		Phi2 is 0
    ),
    Counter1 is Counter + 1,
    totient_phi_3(Num,Counter1,Phi1),
    Phi is Phi1 + Phi2.    