/*Begin Question 3.1*/
indices( IS, XS, ES )
	:- indicesloop(IS,XS,ES).

indicesloop([],_,[]).
indicesloop([IH|IT], XS, [V|W])
	:- nth0(IH,XS,V),
    indicesloop(IT, XS, W).

/*End Question 3.1*/
/*Begin Question 3.2*/

possible(GRID)
	:- perm([1,2,3,4,5,6,7,8,9],GRID).

perm([],[]).
perm(LIST,[H|T]) 
	:- append(X,[H|Y],LIST), /* An X and [H|Y] that can be combined to make LIST */
    append(X,Y,W), /* the combaintion of one solution to the above append */
    perm(W,T). /* T is a possible perm of W */


/*End Question 3.2*/
/*Begin Question 3.3*/
sumlist([], 0).
sumlist([H|T], N)
	:- sumlist( T, W ),
    N is H + W.

equals(XS,SUM)
	:- sumlist(XS,V),
    V == SUM.
       
acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
    :- indices([0,1,3,4],GRID,T0ES), equals(T0ES,T0),
    indices([1,2,4,5],GRID,T1ES), equals(T1ES,T1),
	indices([3,4,6,7],GRID,T2ES), equals(T2ES,T2),
	indices([4,5,7,8],GRID,T3ES), equals(T3ES,T3),
    indices(US,GRID,UES), equals(UES,U),
    indices(VS,GRID,VES), equals(VES,V),
    indices(WS,GRID,WES), equals(WES,W).
    	
		
suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
    :- possible(GRID),
    acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID).


/*End Question 3.3*/
/*any main predicates for testing goes here*/
main
    :-  suko( 15, 14, 26, 23
       , [0,1,2,3], 16
       , [4,6,7], 17
       , [5,8], 12
       , GRID ), write(GRID).