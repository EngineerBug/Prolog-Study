% base case
parse_tree([], []).
% noun phrases
parse_tree(S1, [np|TREE])
	:-
    noun_phrase(S1,S2),
    parse_tree(S2, TREE).
% verb phrase
parse_tree(S1, [vp|TREE])
	:-
    verb_phrase(S1,S2),
    parse_tree(S2, TREE).
% verbs
parse_tree(S1, [v|TREE])
	:-
    verb(S1,S2),
    parse_tree(S2, TREE).

%the simplest possible sentance [noun_phrase] [verb]
sentence(S1) :- noun_phrase(S1,S2), verb(S2,[]).
sentence(S1) :- noun_phrase(S1,S2), verb_phrase(S2,[]).

% define the components of sentances
noun_phrase(S1,S3) :- det(S1,S2), noun(S2,S3).
noun_phrase(S1,S3) :- prop_noun(S1,S3).
noun_phrase(S1,S3) :- pro_noun(S1,S3).
verb_phrase(S1,S3) :- verb(S1,S2), noun_phrase(S2,S3).

% define words as their type
det([the|X], X).
det([a|X], X).
noun([bear|X], X).
noun([rabbit|X], X).
prop_noun([ben|X], X).
pro_noun([he|X], X).
verb([eats|X], X).
verb([runs|X], X).

main(X) :- 
    sentence([the, bear, eats, the, rabbit]),
	sentence([the, bear, eats]),
	sentence([ben, runs]),
    sentence([he, runs]),
    parse_tree([the, bear, eats, the, rabbit], X).