member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

not_member(_, []).
not_member(X, [H|T]) :- X \= H, not_member(X, T).

count_occurrences(_, [], 0).
count_occurrences(X, [X|T], N) :- count_occurrences(X, T, N1), N is N1 + 1.
count_occurrences(X, [_|T], N) :- count_occurrences(X, T, N).


filter_duplicates([], _, []).
filter_duplicates([H|T], List, Result) :-
    count_occurrences(H, List, Count),
    (Count =:= 2 -> Result = [H|Rest]; Result = Rest),
    filter_duplicates(T, List, Rest).

main :-
    process,
    halt.

process :-
    write('Введіть список цілих чисел (завершiть введення "." на новому рядку): '),
    read(List),
    filter_duplicates(List, List, Result),
    write('Результат: '), write(Result), nl.

:- main.