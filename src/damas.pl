:- use_module(library(lists)).
:- [board].

% :- [alpha_beta].
% :- [player].

main :-
    abolish(currentBoard/2),
	board_initialize_game(Board),
	assert(currentBoard(Player, Board)),
	write('Bem-Vindo ao Jogo de Damas!'), put(10),
	write('Por favor introduza a jogada.)\n'), put(10),
    play.

play:-
	currentBoard(Player, Board),
    board_print(Board),
    play(Player, Board).

% aqui vai fazer a escolha da peça para o jogador. Falta acabar no outro ficheiro
play(Player, Board) :- 
	random(0,2,Cor),
    Player = Cor.