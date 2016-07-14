% Duplicate the elements of a list.

dupli([],[]).
dupli([El|Rest],[El,El|Rest1]) :- dupli(Rest,Rest1).