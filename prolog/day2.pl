% Reverse a list
reverse_list([], []).
reverse_list([Head|List], Reversed) :- reverse_list(List, SubReversed), append(SubReversed, [Head], Reversed).

% Find the smallest item in a list
min(A, B, A) :- A =< B.
min(A, B, B) :- B < A.
smallest([Head|[]], Head).
smallest([Head|List], Smallest) :- smallest(List, SubSmallest), min(Head, SubSmallest, Smallest).

% Sort a list
insert_sorted(A, [], [A]).
insert_sorted(A, [B|Rest], [A, B|Rest]) :- A =< B.
insert_sorted(A, [B|Rest], [B|SubSorted]) :- B < A, insert_sorted(A, Rest, SubSorted).

sort_list([], []).
sort_list([A|Rest], Sorted) :- sort_list(Rest, SubSorted), insert_sorted(A, SubSorted, Sorted).
