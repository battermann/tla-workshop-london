-------------------------------- MODULE Pick --------------------------------
EXTENDS Integers, Sequences

Cons(el, seq) == << el >> \o seq

RECURSIVE Last(_)
Last(seq) ==
  IF Len(seq) = 1
  THEN Head(seq)
  ELSE Last(Tail(seq))
  
RECURSIVE Contains(_,_)
Contains(seq, el) ==
  IF Len(seq) = 0 THEN FALSE
  ELSE IF Head(seq) = el THEN TRUE
  ELSE Contains(Tail(seq), el)

RECURSIVE SeqToSet(_)
SeqToSet(seq) ==
  IF Len(seq) = 0 THEN {}
  ELSE { Head(seq) } \cup SeqToSet(Tail(seq))
  
RECURSIVE Map(_,_)
Map(f(_), seq)==
  IF Len(seq) = 0 THEN <<>>
  ELSE Cons(f(Head(seq)), Map(f, Tail(seq)))   

RECURSIVE FoldL(_,_,_)
FoldL(acc, f(_,_), seq) ==
  IF Len(seq) = 0 THEN acc
  ELSE FoldL(f(Head(seq), acc), f, Tail(seq))


VARIABLES basket

vars == << basket >>

CONSTANT Items

\*Init ==
\*  /\ basket = {}

\*Next == 
\*  /\ \E x \in Items : x \notin basket
\*  /\ basket' = basket \cup { CHOOSE x \in Items : x \notin basket }
  
  
Init ==
  /\ basket = <<>>

Next ==
  /\ \E x \in Items : x \notin SeqToSet(basket)
  /\ basket' =  Append(basket, CHOOSE x \in Items : ~Contains(basket, x))
  
Spec ==
  /\ Init
  /\ []([Next]_vars)






=============================================================================
\* Modification History
\* Last modified Fri Sep 20 16:42:05 BST 2019 by leif
\* Created Fri Sep 20 15:32:14 BST 2019 by leif
