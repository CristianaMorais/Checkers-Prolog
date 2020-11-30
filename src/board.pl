% Implementação do tabuleiro.

board(game_board(A,B,C,D,E,F,G,H)):-
	functor(A,l,8), 
	functor(B,l,8),
	functor(C,l,8),
	functor(D,l,8), 
	functor(E,l,8), 
	functor(F,l,8), 
	functor(G,l,8), 
	functor(H,l,8).

empty_board(
	    game_board(
		       l(0, 1, 0, 1, 0, 1, 0, 1),
		       l(1, 0, 1, 0, 1, 0, 1, 0),
		       l(0, 1, 0, 1, 0, 1, 0, 1),
		       l(1, 0, 1, 0, 1, 0, 1, 0),
		       l(0, 1, 0, 1, 0, 1, 0, 1),
		       l(1, 0, 1, 0, 1, 0, 1, 0),
		       l(0, 1, 0, 1, 0, 1, 0, 1),
		       l(1, 0, 1, 0, 1, 0, 1, 0)
		      )).

% Aqui a ideia era retornar a posição
position(Board, X, Y, PF):-
	arg(Y,Board,PI),
	arg(X,PI,PF).

% Cria a tabuleiro de 0´s e 1´s .
board_initialize_empty(game_board(A,B,C,D,E,F,G,H)):-
	board(game_board(A,B,C,D,E,F,G,H)),
	empty_odd(A),
	empty_even(B),
	empty_odd(C),
	empty_even(D),
	empty_odd(E),
	empty_even(F),
	empty_odd(G),
	empty_even(H).

% Cria a tabuleiro inicial.
board_initialize(game_board(A,B,C,D,E,F,G,H)):-
		board(game_board(A,B,C,D,E,F,G,H)),
		board_game_odd(A,black),
		board_game_even(B,black),
		board_game_odd(C,black),
		empty_even(D),
		empty_odd(E),
		board_game_even(F,white),
		board_game_odd(G,white),
		board_game_even(H,white).

empty_odd(Letter):-
	arg(1,Letter,0), 
	arg(2,Letter,1),
	arg(3,Letter,0), 
	arg(4,Letter,1),
	arg(5,Letter,0), 
	arg(6,Letter,1),
	arg(7,Letter,0), 
	arg(8,Letter,1).

empty_even(Letter):-
	arg(1,Letter,1), 
	arg(2,Letter,0),
	arg(3,Letter,1), 
	arg(4,Letter,0),
	arg(5,Letter,1), 
	arg(6,Letter,0),
	arg(7,Letter,1), 
	arg(8,Letter,0).


% Inicializar uma linha.
board_odd(Line,Player):-
	arg(1,Line,0), arg(2,Line,Player),
	arg(3,Line,0), arg(4,Line,Player),
	arg(5,Line,0), arg(6,Line,Player),
	arg(7,Line,0), arg(8,Line,Player).

board_even(Line,Player):-
	arg(1,Line,Player), arg(2,Line,0),
	arg(3,Line,Player), arg(4,Line,0),
	arg(5,Line,Player), arg(6,Line,0),
	arg(7,Line,Player), arg(8,Line,0).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

board_print(game_board(A,B,C,D,E,F,G,H)):-
	tab(3), print(A), tab(2), print(B), tab(2),	print(C), tab(2),print(D), tab(2), print(E), tab(2),print(F), tab(2), print(G), tab(2),print(H), tab(2), put(10),
	board_print_line(A),
	print(2), tab(2),
	board_print_line(B),
	print(3), tab(2),
	board_print_line(C),
	print(4), tab(2),
	board_print_line(D),
	print(5), tab(2),
	board_print_line(E),
	print(6), tab(2),
	board_print_line(F),
	print(7), tab(2),
	board_print_line(G),
	print(8), tab(2),
	board_print_line(H).

board_print_line(L):-
	print_piece(L,1),
	print_piece(L,2),
	print_piece(L,3),
	print_piece(L,4),
	print_piece(L,5),
	print_piece(L,6),
	print_piece(L,7),
	print_piece(L,8),
	put(10).

print_piece(L,Id):-
	arg(Id,L,E),
	E == 1, !,
	write('\uFF3F'),	
	tab(2).

print_piece(L,Id):-
	arg(Id,L,E),
	E == 0, !,
	tab(3).

% peça branca (círculo)			
print_piece(L,Id):-
	arg(Id,L,E),
	E == w, !,
	write('\u25CB'),	
	tab(2).

% peça preta (círculo)
print_piece(L,Id):-
	arg(Id,L,E),
	E == b, !,
	write('\u25CF'),	
	tab(2).

% dama branca
print_piece(L,Id):-
	arg(Id,L,E),
	E == wk, !,
	write('\u2655'),	
	tab(2).

% dama preta
print_piece(L,Id):-
	arg(Id,L,E),
	E == bk, !,
	write('\u265B'), 
	tab(2).

print_piece(L,Id):-
	arg(Id,L,E),
	print(E),		
	tab(2).