last([E], E).
last([_|T], E)
	:- last(T, E).

stars( 0, [] ).
stars( N, L )
	:- N1 is N - 1,
    stars( N1, L1 ),
    append([42], L1, L).

blat( [], [] ).
blat( [A], [A]).
blat( [A,B], [A,B]).
blat( [H|T], [H|W] )
	:- length( T, N ),
    N1 is N - 1,
    stars( N1, S ),
    last( T, L ),
    append( S, [L], W).
    
%blat2( [], [] ).
%blat2( [A], [A]).
%blat2( [A,B], [A,B]).
%blat2( [H|T], L )
%	:- L is [H|append([last( T )], stars(T, _), L)].
    %append([last(T)], [H|blat(T, L1)], L). 

censor( S, C )
	:- name( S, S1 ),
	blat( S1, C1 ),
    name( C, C1 ).

censorAll([], []).
censorAll( [H|T], [V|W] )
	:- censor( H, V ),
    censorAll( T, W ).

rude(fucking).
rude(heck).

censorSome([], []).
censorSome([H|T], [H1|L] )
	:- rude( H ),
    censor(H, H1),
    censorSome( T, L ).
censorSome( [H|T], [H|L] )
	:- \+ rude( H ),
    censorSome(T, L).

main
	:- censorSome([fucking, heck, nuts], X), write(X).
