% Реализация стандартных предикатов обработки списков

my_length([], 0).
my_length([_|X], Z):- my_length(X, Y), Z is Y + 1.

my_member(X, [X|_]).
my_member(X, [_|Y]):- my_member(X, Y).

my_append([], X, X).
my_append([X|L1], L2, [X|L3]):- my_append(L1, L2, L3).

my_remove(X, [X|L], L).
my_remove(X, [Y|L], [Y|Z]):- my_remove(X, L, Z).

my_permute([], []).
my_permute(L, [X|Z]):- my_remove(X, L, Y), my_permute(Y, Z).

my_sublist(X, Y):- my_append(_, Z, Y), my_append(X, _, Z).



% Вариант 4 - удаление трех первых элементов списка

% delete_1 на основе стандартных предикатов 
delete_1(X, []):- length(X, N), N =< 3.
delete_1(X, L3):- append([_], L3, L2), append([_], L2, L1), append([_], L1, X).

% delete_2 без использования стандартных предикатов
remove_first([X|Y], Y).
delete_2([], []).
delete_2([_],[]).
delete_2([_,_], []).
delete_2(X, L3):- remove_first(X, L1), remove_first(L1, L2), remove_first(L2, L3).



% Вариант 9 - вычисление числа вхождения 1-го элемента

% count_1 на основе стандартных предикатов 
count_first(X, Y, 0):- not(member(X, Y)).
count_first(X, Y, N):- append(_, [X|Z], Y), count_first(X, Z, N1), N is N1 + 1.
count_1([], 0).
count_1([X|Y], N):- count_first(X, [X|Y], N).

% count_2 без использования стандартных предикатов
count_second(_, [], 0).
count_second(X, [X|Z], N):- count_second(X, Z, N1), N is N1 + 1.
count_second(X, [_|Z], N):- count_second(X, Z, N).
count_2([], 0).
count_2([X|Y], N):- count_second(X, [X|Y], N).
