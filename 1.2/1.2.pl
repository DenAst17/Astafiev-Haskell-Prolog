split([], [], [], [], []).
split([H|T], [H|T0], T1, T2, T3) :- H mod 4 =:= 0, split(T, T0, T1, T2, T3).
split([H|T], T0, [H|T1], T2, T3) :- H mod 4 =:= 1, split(T, T0, T1, T2, T3).
split([H|T], T0, T1, [H|T2], T3) :- H mod 4 =:= 2, split(T, T0, T1, T2, T3).
split([H|T], T0, T1, T2, [H|T3]) :- H mod 4 =:= 3, split(T, T0, T1, T2, T3).

main :-
    process,
    halt.

process :-
    write('Введіть список цілих чисел (завершiть введення "." на новому рядку): '),
    read(List),
    split(List, List1, List2, List3, List4),
    write('Спиcok 1: '), write(List1), nl,
    write('Спиcok 2: '), write(List2), nl,
    write('Спиcok 3: '), write(List3), nl,
    write('Спиcok 4: '), write(List4).

:- main.