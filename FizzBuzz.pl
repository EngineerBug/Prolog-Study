result(N, A)
	:- mod(N, 3) =:= 0,
    mod(N, 5) =:= 0,
    A = fizzbuzz.
result(N, A)
	:- mod(N, 3) =:= 0,
    mod(N, 5) =\= 0,
    A = fizz.
result(N, A)
	:- mod(N, 5) =:= 0,
    mod(N, 3) =\= 0,
    A = buzz.
result(N, A)
    :- mod(N, 3) =\= 0,
    mod(N, 5) =\= 0,
    A = N.
