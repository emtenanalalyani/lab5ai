% Males
male(abraham).
male(herb).
male(homer).
male(clancy).
male(bart).

% Females
female(mona).
female(marge).
female(jackie).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parents
parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(selma, ling).


% Rules

father(X,Y) :-
    male(X),
    parent(X,Y).

mother(X,Y) :-
    female(X),
    parent(X,Y).

son(X,Y) :-
    male(X),
    parent(Y,X).

daughter(X,Y) :-
    female(X),
    parent(Y,X).

sibling(X,Y) :-
    parent(P,X),
    parent(P,Y),
    X \= Y.

brother(X,Y) :-
    male(X),
    sibling(X,Y).

sister(X,Y) :-
    female(X),
    sibling(X,Y).

grandfather(X,Y) :-
    male(X),
    parent(X,Z),
    parent(Z,Y).

aunt(X,Y) :-
    female(X),
    parent(P,Y),
    sister(X,P).

uncle(X,Y) :-
    male(X),
    parent(P,Y),
    brother(X,P).

cousin(X,Y) :-
    parent(P1,X),
    parent(P2,Y),
    sibling(P1,P2).

ancestor(X,Y) :-
    parent(X,Y).

ancestor(X,Y) :-
    parent(X,Z),
    ancestor(Z,Y).
