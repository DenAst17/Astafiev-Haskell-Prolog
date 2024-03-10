split_into_sublists([], _, []).

split_into_sublists(List, N, [Sublist|Rest]) :-
    length(List, Size),
    SubLength is min(Size, N),
    length(Sublist, SubLength),
    append(Sublist, Remaining, List),
    NextN is N * 2,
    split_into_sublists(Remaining, NextN, Rest).

split(List, Result) :-
    split_into_sublists(List, 1, Result).

main :-
    process,
    halt.

process :-
    write('Введіть список цілих чисел (завершiть введення "." на новому рядку): '),
    read(List),
    split(List, Result),
    write('Результат: '), write(Result), nl.

:- main.