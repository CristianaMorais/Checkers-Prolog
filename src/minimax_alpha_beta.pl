% Implementação do algoritmo alpha-beta com minimax. (mal)

% Aqui é para o minimax
minimax(Player1, Board, NextMove, Eval, Depth) :-
	Depth < 5,
	NewDepth is Depth + 1,
	next_player(Player, Player2),
	list_available_moves(Board, Player2, Moves),
	best(Player2, Moves, NextMove, Eval, NewDepth), !.

minimax(Player, Board, _, Eval, Depth) :-
	evaluate_board(Board, Eval, 1), !.	

minmax(Direction, _, Board, Board, Score, Depth, _, _) :-
    possible_moves_list(Direction, Board, [], Depth),
    evaluate_board(Board, Score), !.

minmax(Direction, NodeType, Board, BestBoard, BestScore, Depth, Alpha, Beta) :-
    possible_moves_list(Direction, Board, PossibleMoves, Depth),
    find_best_move(Direction, NodeType, PossibleMoves, BestBoard, BestScore, Depth, Alpha, Beta).


alpha_beta_prune(max, _, Beta, Value)  :- 
    Value > Beta.
    
alpha_beta_prune(min, Alpha, _, Value) :- 
    Value < Alpha.

% Faz o update ao Alpha ou Beta conforme o novo valor
update_alpha_beta(max, Alpha, Beta, NewValue, NewAlpha, Beta) :- 
    (NewValue > Alpha, !, NewAlpha = NewValue) 
    ; 
    (NewAlpha = Alpha).

update_alpha_beta(min, Alpha, Beta, NewValue, Alpha, NewBeta) :- 
    (NewValue < Beta,  !, NewBeta = NewValue) 
    ; 
    (NewBeta = Beta).