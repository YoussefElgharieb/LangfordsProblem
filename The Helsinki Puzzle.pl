grid_build(N,M):-
    grid_build(N,M,0).

grid_build(N,[],N).
grid_build(N,[H|T],A):-
    N > A,
    length(H,N),
    NA is A + 1,
    grid_build(N,T,NA).


grid_gen(N,M):-
    grid_build(N,M),
    grid_gen(N,M,0).



grid_gen(N,[],N).
grid_gen(N,[H|T],A):-
    N > A,
    row_gen(1,N,H),
    NA is A + 1,
    grid_gen(N,T,NA).


row_gen(F,L,R):- 
    A is F - 1,
    row_gen(F,L,R,A).

row_gen(_,L,[],L).
row_gen(F,L,[H|T],A):-
    A < L,
    row_gen_helper(F,L,H),
    NA is A + 1,
    row_gen(F,L,T,NA).

row_gen_helper(F,L,H):-
    F =< L,    
    (   
        F = H;
        NF is F + 1,
        row_gen_helper(NF,L,H)
    ).



num_gen(X,X,[X]).
num_gen(F,L,[F|T]):-
    F < L,
    NF is F + 1,
    num_gen(NF,L,T).


check_num_grid(M):-
    length(M,N),
    grid_gen(N,M),
    max_list_of_lists(M,X,[]),
    NX is X-1,
    check_num_grid(M,NX).

check_num_grid(_,0).
check_num_grid(M,X):-
    member_list_of_lists(X,M),
    NX is X -1,
    check_num_grid(M,NX).

member_list_of_lists(X,[H|T]):-
    member(X,H),!;
    member_list_of_lists(X,T).

max_list_of_lists([],X,A):-
    max_list(A,X).
max_list_of_lists([H|T],X,A):-
    max_list(H,MAX),
    NA = [MAX|A],
    max_list_of_lists(T,X,NA).


acceptable_permutation(L,R):-
    permutation(L,R),
    acceptable_permutation_helper(L,R).

acceptable_permutation_helper([],[]).
acceptable_permutation_helper([H1|T1],[H2|T2]):-
    H1 \== H2,
    acceptable_permutation_helper(T1,T2).



acceptable_distribution(M):-
    trans(M,TM),
    acceptable_permutation_helper(M,TM).


row_col_match(M):-
    acceptable_distribution(M),
    trans(M,TM),
    row_col_match(M,TM).

row_col_match([],_).
row_col_match([H|T],TM):-
    member(H,TM),
    row_col_match(T,TM).


trans([[]|_],[]).
trans(M,TM):-
    get_first_column(M,C),
    remove_first_column(M,NM),
    trans(NM,TNM),
    TM = [C|TNM].

get_first_column([],[]).
get_first_column([[H|_]|T],C):-
    get_first_column(T, NC),
    C = [H|NC].

remove_first_column(M,R):-
    length(M,L),
    remove_first_column(M,R,L).

remove_first_column(X,X,0).
remove_first_column([[_|T]|NM],R,L):-
    NL is L -1,
    remove_first_column(NM,NR,NL),
    R = [T|NR].


distinct_rows([H|T]):-
    distinct_rows(H,T).

distinct_rows(_,[]).
distinct_rows(R,L):-
    \+member(R,L),
    L = [H|T],
    distinct_rows(H,T).

distinct_columns(M):-
    trans(M,TM),
    distinct_rows(TM).


helsinki(N,G):-
    grid_gen(N,G),
    check_num_grid(G),
    distinct_rows(G),
    distinct_columns(G),
    row_col_match(G).



