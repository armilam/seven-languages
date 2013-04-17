concatenate([], List, List).
concatenate([Head|Tail], List, [Head|TailCat]) :- concatenate(Tail, List, TailCat).

