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

fizzBuzz(C, N, A)
    :- C > 0,
    result(N,A),
    writeln(A),
    C1 is C - 1,
    N1 is N + 1,
    fizzBuzz(C1, N1, _).

main
    :- fizzBuzz(10, 1, _).