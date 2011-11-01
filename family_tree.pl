age(Robbie,23).
age(Tyler,25).
age(David,75).
age(Rick,54).
age(Brent,19).
age(Lucas,9).
age(Larry,51).
age(Brian,23).
age(Jill,52).
age(Sabra,72).
age(Leslie,53).
age(Kelly,49).
age(Erick,24).
age(Shelly,24).
age(Nikki,29).
gender(Robbie,Male).
gender(Tyler,Male).
gender(David,Male).
gender(Rick,Male).
gender(Brent,Male).
gender(Lucas,Male).
gender(Larry,Male).
gender(Brian,Male).
gender(Jill,Female).
gender(Sabra,Female).
gender(Leslie,Female).
gender(Kelly,Female).
gender(Erick,Female).
gender(Shelly,Female).
gender(Nikki,Female).
child(Tyler,Jill).
child(Tyler,Rick).
child(Robbie,Rick).
child(Robbie,Jill).
child(Jill,David).
child(Jill,Sabra).
child(Kelly,David).
child(Kelly,Sabra).
child(Leslie,David).
child(Leslie,Sabra).
child(Lucas,Erick).
child(Lucas,Shelly).
child(Nikki,Leslie).
child(Shelly,Leslie).
child(Brian,Kelly).
child(Brian,Larry).
child(Brent,Kelly).
child(Brent,Larry).

father(F,C) :- gender(F,Male), child(C,F).

mother(M,C) :- gender(M,Female), child(C,M).

parent(P,C) :- child(C,P).

sibling(X,Y) :- child(X,P), child(Y,P), X \= Y.

grandparent(G,C) :- child(C,P), child(P,G).

kthchild(C,P,1) :- child(C,P), age(C,X), X>Y, age(S,Y), sibling(C,S).
kthchild(C,P,K) :- child(C,P), age(C,X), X>Y, age(S,Y), sibling(C,S), kthchild(S,P,W), W<K.

nthcousin(X,Y,1) :- grandparent(G,X), grandparent(G,Y), \+ sibling(X,Y).
nthcousin(X,Y,N) :- child(X,Z), child(Y,W), nthcousin(Z,W,N-1).

nthcousinkremoved(X,Y,N,1) :- child(X,Z), nthcousin(Z,Y,N).
nthcousinkremoved(X,Y,N,K) :- child(X,Z), nthcousinkremoved(Z,Y,N,K-1).
