% Exercise 1

% Write a Prolog predicate distance/3 to calculate the distance
% between two points in the 2-dimensional plane. Points are given as pairs of coordinates.

distance((X1,Y1), (X2,Y2), D) :- D is sqrt((X1 - X2)^2 + (Y1 - Y2)^2).

% Exercise 2

% Write a Prolog program to calculate the factorial of a given number.
% Make sure to implement it recursively.

factorial(0,1).
factorial(N,X):- NN is N - 1, factorial(NN,X1), X is X1 * N.
factorial(N):- factorial(N,X), write(X).

% Exercise 3

% Implement a Prolog predicate n_vowels/2 that counts the number of vowels
% in a given list of letters.

vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

n_vowels([H|T], Count) :- n_vowels(T, VCount), (vowel(H) -> Count is VCount + 1 ; Count is VCount).
n_vowels([], 0).

% Exercise 4
% Implement a Prolog predicate that returns the last element of a list in two different ways.

% (a) Write a predicate last1/2 using a recursion and the head/tail-pattern for lists.

last1([H], X)  :- X = H.
last1([_|T],X) :- last1(T, X).

% (b) Define a similar predicate last2/2 solely in terms of append/3, without using a recursion.

append([],YS,YS).
append([X|XS],YS,[X|ZS]):- append(XS,YS,ZS).
append3(XS, YS, ZS, WS) :- append(XS, YS, TS), append(TS, ZS, WS).

last2([_|T], X) :- append3(_,_,T,X).

% Exercise 5
% Write a Prolog predicate list_length/2 that returns the number of elements in a list.

list_length([],X):- X = 0.
list_length([_|T],Count):- list_length(T, Prev), Count is Prev + 1.

% Exercise 6
% Implement a Prolog predicate that takes two lists as arguments
% and succeeds if the second is longer (has more elements) than the first.

% (a) Write a predicate longer_list1/2 using the list_length predicate in the previous exercise.

longer_list1(L1, L2) :- list_length(L1, X), list_length(L2, Y), (X < Y -> true; false).

% (b) Write a predicate longer_list2/2 using recursion and without using any arithmetic expressions.

longer_list2([], [_]).
longer_list2([_|T1], [_|T2]) :- longer_list2(T1, T2).
