col(0..n-1).
row(0..n-1).

% cell(X,Y,C): represents a binairo cell, X: row position,  Y: col position, C: color; 0 white 1 black
% Assigns a color to each circle, white or black
1 {cell(X,Y,0..1)} 1 :- col(X), row(Y).

% It is not possible having two white or black consecutive circles in a row or column
:- cell(X,Y,C), cell(X+1,Y,C), cell(X+2,Y,C).
:- cell(X,Y,C), cell(X,Y+1,C), cell(X,Y+2,C).

% It is not possible having more white circles than black ones per each row or column.
:- row(X), W=#count{Y: cell(X,Y,C), C==0}, B=#count{Y: cell(X,Y,C), C==1}, W!=B.
:- col(Y), W=#count{X: cell(X,Y,C), C==0}, B=#count{X: cell(X,Y,C), C==1}, W!=B.

% It is not possible having two rows or columns with the same color combination.
:- row(X) , row(X'), X<X', T=#count{Y: cell(X,Y,C), cell(X',Y,C)}, T==n.
:- col(Y) , col(Y'), Y<Y', T=#count{X: cell(X,Y,C), cell(X,Y',C)}, T==n.

#show cell/3.