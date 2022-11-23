maxOf([E], E).
maxOf([H,H1|T], E)
	:- (   H > H1
       ->  maxOf([H|T], E)
       ;   maxOf([H1|T], E)
       ).