:-use_module(library(lists)).

board(game_board(A,B,C,D,E,F,G,H)):-
	functor(A,line,8), 
	functor(B,line,8),
	functor(C,line,8),
	functor(D,line,8), 
	functor(E,line,8), 
	functor(F,line,8), 
	functor(G,line,8), 
	functor(H,line,8).

init_Board(game_board(line(w,0,w,0,w,0,w,0),
              	      line(0,w,0,w,0,w,0,w),
              	      line(w,0,w,0,w,0,w,0),
              	      line(0,1,0,1,0,1,0,1),
              	      line(1,0,1,0,1,0,1,0),
              	      line(0,b,0,b,0,b,0,b),
              	      line(b,0,b,0,b,0,b,0),
              	      line(0,b,0,b,0,b,0,b))).

showBoard(game_board(A,B,C,D,E,F,G,H)):-
	tab(26), print(1), 
	tab(2), print(2), 
	tab(2), print(3), 
	tab(2), print(4), 
	tab(2), print(5), 
	tab(2), print(6), 
	tab(2), print(7), 
	tab(2),print(8), 
	tab(2), nl,
	tab(23), print(1), tab(2),
	printLine(A),
	tab(23), print(2), tab(2),
	printLine(B),
	tab(23), print(3), tab(2),
	printLine(C),
	tab(23), print(4), tab(2),
	printLine(D),
	tab(23), print(5), tab(2),
	printLine(E),
	tab(23), print(6), tab(2),
	printLine(F),
	tab(23), print(7), tab(2),
	printLine(G),
	tab(23), print(8), tab(2),
	printLine(H).
	
printLine(Line):-
	printElem(Line,1),
	printElem(Line,2),
	printElem(Line,3),
	printElem(Line,4),
	printElem(Line,5),
	printElem(Line,6),
	printElem(Line,7),
	printElem(Line,8),
	nl.

% Imprimir a peça de cada linha
printElem(Line,Index):-
	arg(Index,Line,Elem),
	print(Elem),		
	tab(2).