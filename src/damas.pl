:-use_module(library(lists)).
:- [board].

main :-
	abolish(current/2),
	init_Board(Board),
	assert(current(white, Board)),
	write('*-----------------------------------------------------------------------------*'), nl,
	write('*                        Bem-Vindo ao Jogo de Damas!                          *'), nl,
	write('*                 As peças brancas serão as primeiras a jogar.                *'), nl,
	write('*-----------------------------------------------------------------------------*'), nl,
	write('* w -> Peça branca ; b -> Peça preta ; 0 -> espaço branco ; 1 -> espaço preto *'), nl,
	write('*-----------------------------------------------------------------------------*'), nl,
	play.

play:-
    current(Player, Board), nl,
    showBoard(Board).