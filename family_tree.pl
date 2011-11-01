/*
age(robbie,23).
age(tyler,25).
age(david,75).
age(rick,54).
age(brent,19).
age(lucas,9).
age(larry,51).
age(brian,23).
age(jill,52).
age(dabra,72).
age(leslie,53).
age(kelly,49).
age(erick,24).
age(shelly,24).
age(nikki,29).
age(wat,2).
age(duh,1).
gender(robbie,male).
gender(tyler,male).
gender(david,male).
gender(rick,male).
gender(brent,male).
gender(lucas,male).
gender(larry,male).
gender(brian,male).
gender(erick,male).
gender(jill,female).
gender(sabra,female).
gender(leslie,female).
gender(kelly,female).
gender(shelly,female).
gender(nikki,female).
child(tyler,jill).
child(tyler,rick).
child(robbie,rick).
child(robbie,jill).
child(jill,david).
child(jill,sabra).
child(kelly,david).
child(kelly,sabra).
child(leslie,david).
child(leslie,sabra).
child(lucas,erick).
child(lucas,shelly).
child(nikki,leslie).
child(shelly,leslie).
child(brian,kelly).
child(brian,larry).
child(brent,kelly).
child(brent,larry).

child(wat,lucas).
child(duh,tyler).
*/

age(a,1).
age(b,2).
age(c,3).
age(d,4).
age(e,5).
age(f,6).
age(g,7).
age(h,8).
age(i,9).
age(j,10).
age(k,11).
age(l,12).
age(m,13).
age(n,14).
age(o,15).
age(p,16).
age(q,17).
age(r,18).
age(s,19).
age(t,20).
age(u,21).
age(v,22).
age(w,23).
age(x,24).
age(y,25).
age(z,26).
child(b,a).
child(c,a).
child(d,b).
child(e,b).
child(f,c).
child(g,c).
child(h,d).
child(i,d).
child(j,e).
child(k,e).
child(l,f).
child(m,f).
child(n,g).
child(o,g).
child(p,h).
child(q,h).
child(r,i).
child(s,i).
child(t,j).
child(u,j).
child(v,k).
child(w,k).
child(x,l).
child(y,l).
child(z,m).

father(F,C) :- gender(F,male), child(C,F).

mother(M,C) :- gender(M,female), child(C,M).

parent(P,C) :- child(C,P).

sibling(X,Y) :- child(X,P), child(Y,P), X \= Y.

grandparent(G,C) :- child(C,P), child(P,G).

kthchild(C,P,K) :-  setof(X, child(X, P), List), sortbyage(List, SortedList), nth(K, SortedList, C).

nthcousin(X,Y,1) :- grandparent(G,X), grandparent(G,Y), \+ sibling(X,Y), X\=Y.
nthcousin(X,Y,N) :- child(X,Z), child(Y,W), nthcousin(Z,W,N-1),X\=Y.

nthcousinkremoved(X,Y,N,0) :- nthcousin(X,Y,N).
nthcousinkremoved(X,Y,N,K) :- integer(I), I = K-1, child(X,Z), nthcousinkremoved(Z,Y,N,I).


older(A,B) :- age(A,X), age(B,Y), X>Y.

sortbyage(L,A) :- permutation(L,A), issortedbyage(A).
issortedbyage([_|[]]).
issortedbyage([]).
issortedbyage([H,A|T]) :- older(H,A), issortedbyage([A|T]).
