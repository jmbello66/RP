
cell(1..nrows, 1..ncols).
element(E) :- end(E,_).
1 { action(mov(E,X,Y))} 1 :- element(E), X=0..nrows-1, Y=0..ncols-1, not obs(X,Y), not fill(X,Y,_).

#program dynamic.
%based on action movements, we can define fluent on(E) to represent a wire E
% is placed on a specific cell as value
%only allow to place a wire on a cell if it is empty.
h(on(E), cell(X,Y)) :- 'fill(X',Y,E), |X-X'|=1, o(mov(E,X,Y)), not 'fill(X,Y,_).
h(on(E), cell(X,Y)) :- 'fill(X,Y',E), |Y-Y'|=1, o(mov(E,X,Y)), not 'fill(X,Y,_).

%it is not possible to hold a fluent on if it is an obstacle on the cell.
:-h(on(E), cell(X,Y)), obs(X,Y).
%it is not possible to hold a fluent on if it is not empty.
:-h(on(E), cell(X,Y)),'fill(X,Y,_).
%we use predicate auxiliar fill 
fill(X,Y,E) :- h(on(E), cell(X,Y)).
%keep previous fill and endPoint
fill(X,Y,E) :- 'fill(X,Y,E).
endPoint(E,X,Y) :- 'endPoint(E,X,Y).

1 { o(A): _action(A)} 1.

#program initial.
1 { h(on(E), cell(X,Y)) } 1 :- end(E,c(X,Y)).
fill(X,Y,E) :- h(on(E), cell(X,Y)).
1 { endPoint(E,X,Y) } 1 :- end(E,c(X,Y)).

#program final.
%validate if the solution is completed
%%firstly we define the predicate connected in order to check if two cells are somehow conencted between them.
connected(E,X,Y,X',Y) :- fill(X',Y,E), fill(X,Y,E), |X-X'|=1.
connected(E,X,Y,X,Y') :- fill(X,Y',E), fill(X,Y,E), |Y-Y'|=1.

connected(E,X,Y,X',Y) :- fill(X',Y,E), fill(X2,Y,E), connected(E,X,Y,X2,Y),connected(E,X2,Y,X',Y), X'!=X2, X!=X'.
connected(E,X,Y,X,Y') :- fill(X,Y',E), fill(X,Y2,E), connected(E,X,Y,X,Y2),connected(E,X,Y2,X,Y'), Y'!=Y2, Y!=Y'.

connected(E,X,Y,X',Y') :-fill(X,Y,E), fill(X',Y',E), fill(X,Y2,E),connected(E,X,Y,X,Y2),connected(E,X,Y2,X',Y'), X!=X', Y!=Y'.
connected(E,X,Y,X',Y') :-fill(X,Y,E), fill(X',Y',E), fill(X2,Y,E),connected(E,X,Y,X2,Y),connected(E,X2,Y,X',Y'), X!=X', Y!=Y'.

%a wire W has benn completed if, for its endPoints they are both connected.
completed(E) :- endPoint(E,X,Y), endPoint(E,X',Y'), connected(E,X,Y,X',Y'), fill(_,_,E).
%goal
:- not completed(E), endPoint(E,_,_).

#show fill/3.
#show obs/2.
#show dim/2.
#show o/1.
#show h/2.
#show completed/1.








