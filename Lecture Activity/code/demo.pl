% Facts (what we know)

father(john, joseph). % John is father of Joseph
father(john, bill). % John is father of Bill

father(bob, ken). % Bob is father of Ken
father(bob, jeff). % Bob is father of Jeff
father(bob, ron). % Bob is father of Ron

father(matt,john). % Matt is father of John
father(matt,bob). % Matt is father of Bob


% Rules (what new things we can infer given what we know)

brother(X, Y) :-
	X \== Y, 	% X and Y are not the same person
	father(A, X), % let A be the father of X
	father(A, Y). % check if A is also the father of Y

cousin(X, Y) :-
	father(A, X), % let A be the father of X
	father(B, Y), % let B be the father of Y
	brother(A, B). % check if A and B are brothers
	