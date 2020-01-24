---------------------------- MODULE TrafficLight ----------------------------

VARIABLES light

vars == << light >>

Lights == { "green", "yellowred", "yellow", "red" }

TypeOk == light \in Lights

Init == light = "red"

NextLight(current, next) ==
  /\ light = current
  /\ light' = next
  
Next ==
  \/ NextLight("green", "yellow")
  \/ NextLight("yellow", "red")
  \/ NextLight("red", "yellowred")
  \/ NextLight("yellowred", "green")
  
Spec == 
  /\ Init
  /\ []([Next]_vars)
  /\ WF_vars(Next)

RedLeadsToGreen == light = "red" ~> light = "green"

=============================================================================
\* Modification History
\* Last modified Fri Sep 20 14:53:34 BST 2019 by leif
\* Created Fri Sep 20 11:34:09 BST 2019 by leif
