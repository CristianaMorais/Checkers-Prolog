% Implementação.

main :-
	board_initialize_game(Board),
	write('Bem-Vindo ao Jogo de Damas!'), n,
	write('Por favor introduza a jogada.)\n'),
	play.

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

% Cria a tabuleiro inicial.
board_initialize_game(game_board(A,B,C,D,E,F,G,H)):-