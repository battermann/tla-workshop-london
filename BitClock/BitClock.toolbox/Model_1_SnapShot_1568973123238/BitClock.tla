------------------------------ MODULE BitClock ------------------------------

EXTENDS Integers
VARIABLES clock

PossibleValues == { 0, 1 }

TypeOk == clock \in PossibleValues

Init == clock = 0

ZeroToOne == clock = 0 /\ clock' = 1

OneToZero == clock = 1 /\ clock' = 0

Next == ZeroToOne \/ OneToZero



=============================================================================
\* Modification History
\* Last modified Fri Sep 20 10:49:55 BST 2019 by leif
\* Created Fri Sep 20 10:43:35 BST 2019 by leif
