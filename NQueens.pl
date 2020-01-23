% n_queens functor returns the final positions of all the N Queens 
n_queens(N,QueenArray) :-
    list(1,N,UnplacedArray),
    pos_queen(UnplacedArray,[],QueenArray).


% pos_queen functor places all the queens in safe position
%It also backtracks if no safe position is available.
% If all the queens are placed then it returns the array.
% The select(A,B,C) functor is an inbuit functor where it returns true if list 'B'=list 'C'
%when element 'A' is removed from list 'B'.
pos_queen([],QueenArray,QueenArray).
pos_queen(UnplacedArray,PlacedArray,QueenArray) :-
    select(Q,UnplacedArray,UnplacedArray1),
    \+ conflict(Q,PlacedArray),
    pos_queen(UnplacedArray1,[Q|PlacedArray],QueenArray).


% list is the range of integers from I to J.
list(J,J,[J]).
list(I,J,[I|IntegerArray]) :-
    I < J, I1 is I + 1, list(I1,J,IntegerArray).


% conflict functor finds if there is any conflict in the position of the queen placed
% If there is a conflict then it returns true else false
conflict(Q,QueenArray) :- conflict(Q,1,QueenArray).
conflict(X,N,[Y|_]) :- X is Y + N.
conflict(X,N,[Y|_]) :- X is Y - N.
conflict(X,N,[_|LeftoverArray]) :-
    N1 is N + 1, conflict(X,N1,LeftoverArray).