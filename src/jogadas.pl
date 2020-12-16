% cima -> esquerda
move_piece(Board,Piece,X,Y,m(X,Y,X1,Y1,New_Board)):-
	queen(Piece),
	X > 1, Y > 1,
	X1 is X - 1, Y1 is Y - 1,
	\+ verify_coord(Board,X1,Y1),
	move(Board,X,Y,X1,Y1,New_Board).

% cima -> direita
move_piece(Board,Piece,X,Y,new_move(X,Y,X1,Y1,New_Board)):-
	dama(Piece),
	X < 8, Y > 1,
	X1 is X + 1, Y1 is Y - 1,
	\+ verify_coord(Board,X1,Y1),
	move(Board,X,Y,X1,Y1,New_Board).

% baixo -> esquerda
move_piece(Board,Piece,X,Y,new_move(X,Y,X1,Y1,New_Board)):-
	dama(Piece),
	X > 1, Y < 8,
	X1 is X - 1, Y1 is Y + 1,
	\+ verify_coord(Board,X1,Y1),
	move(Board,X,Y,X1,Y1,New_Board).

% baixo -> direita
move_piece(Board,Piece,X,Y,new_move(X,Y,X1,Y1,New_Board)):-
	dama(Piece),
	X < 8, Y < 8,
	X1 is X + 1, Y1 is Y + 1,
	\+ verify_coord(Board,X1,Y1),
	move(Board,X,Y,X1,Y1,New_Board).

dama(qw).
dama(qb).

% ver se está ocupada
verify_coord(Board,X,Y):-
	pos(Board,X,Y,Piece),
	\+ integer(Piece).

move(Board,Xi,Yi,Xf,Yf,New_Board):- 
	coord(Board,Xi,Yi,Piece),                         % obter uma posição
	remove_coord(Board,Xi,Yi,Temp_Board),             % remove a posição
	promoteDama(Yf,Piece,Piece2),                     % promover a dama
	add_coord(Temp_Board,Xf,Yf,Piece2,New_Board).     % adiciona uma nova posição

% Ir buscar um coordenada
coord(Board, X, Y, Val):-
	arg(Y,Board,ValAux),
	arg(X,ValAux,Val).

remove_coord(Board,X,Y,New_Board):-
	init_board(InitBoard),
	coord(InitBoard,X,Y,Coord),
	modify_Coord(Board,X,Y,Coord,New_Board).

modify_Coord(Board, X, Y, Piece, New_Board):-
	functor(New_Board,game_board,8),
	modifyBoard(Board,X,Y,Piece,New_Board,1).

modifyBoard(_,_,_,_,_,Count):-    % ainda tenho de criar, ir modificando posição a posição
	Count > 8, !.

% promover a Dama
promoteDama(1,w,qw):- !.
promoteDama(8,b,qb):- !.
promoteDama(_,Piece,Piece).