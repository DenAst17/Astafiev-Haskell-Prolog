member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

not_member(_, []).
not_member(X, [H|T]) :- X \= H, not_member(X, T).

count_occurrences(_, [], 0).
count_occurrences(X, [X|T], N) :- count_occurrences(X, T, N1), N is N1 + 1.
count_occurrences(X, [_|T], N) :- count_occurrences(X, T, N).


filter_duplicates([], []).
filter_duplicates([H|T], Result) :-
    count_occurrences(H, [H|T], Count),
    (Count =:= 2 -> Result = [H|Rest]; Result = Rest),
    filter_duplicates(T, Rest).

remove_elements([], _, []).
remove_elements([H|T], ToKeep, Result) :-
    not_member(H, ToKeep),
    !,
    remove_elements(T, ToKeep, Result).
remove_elements([H|T], ToKeep, [H|Result]) :-
    remove_elements(T, ToKeep, Result).


main :-
    process,
    halt.

process :-
    write('Введіть список цілих чисел (завершiть введення "." на новому рядку): '),
    read(List),
    filter_duplicates(List, ToKeep),
    remove_elements(List, ToKeep, Result),
    write('Результат: '), write(Result), nl.

:- main.