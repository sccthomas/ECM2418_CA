/*Begin Question 4.1*/
divisible(N2,N)
	:- N mod N2 =:= 0. 

divisible(N2,N) 
	:- N3 is N2 - 1,
    N3 > 1,
    divisible(N3,N).	

prime(1).
prime(2).
prime(3).
prime(N)
	:- sqrt(N,N1),
    floor(N1,N2),
    \+(divisible(N2,N)).
/*End Question 4.1*/

/*Begin Question 4.2*/
possible(X,Y,Z)
	:- bearings(123,179,X),bearings(182,271,Y),bearings(271,359,Z).

bearings(L,_,L).
bearings(L,H,O) 
	:- L1 is L+1, 
    L1 =< H, 
    bearings(L1, H, O).

/*End Question 4.2*/

/*Begin Question 4.3*/

memberlist(E, [E|_]). 
memberlist(E, [_|T])
    :- memberlist(E,T).

acceptable( X, Y, Z ) 
	:- number_chars(X,XL),number_chars(Y,YL),number_chars(Z,ZL),
    \+memberlist('0',XL),\+memberlist('0',YL),\+memberlist('0',ZL),
    append(XL,YL,XY),append(XY,ZL,XYZ),
    is_set(XYZ),
    \+prime(X),\+prime(Y),\+prime(Z).

trait(X,Y,Z)
	:- possible(X,Y,Z),
    acceptable(X,Y,Z).

/*End Question 4.3*/


main 
  	:- trait(X,Y,Z),writeln(X),writeln(Y),writeln(Z),nl.
    
