------------------------------ MODULE PingPong ------------------------------
EXTENDS Integers

VARIABLES ping, pong

vars == << ping, pong >>

\* always evetually => ???
\* eventually always => terminnates

Terminated == <>[](ping = "ping" /\ pong = "pong")

PingLeadsToPong == ping = "ping" ~> pong = "pong"

TypeOk ==
  /\ ping \in { "", "ping" }
  /\ pong \in { "", "pong" }
  
Init == ping = "" /\ pong = ""

Ping ==
  /\ ping = ""
  /\ ping' = "ping"
  /\ UNCHANGED << pong >>
  
Pong ==
  /\ ping = "ping"
  /\ pong = ""
  /\ pong' = "pong"
  /\ UNCHANGED << ping >>
  
Reset ==
  /\ ping = "ping"
  /\ pong = "pong"
  /\ ping = ""
  /\ pong = ""
  
Next == Ping \/ Pong  

Spec == 
  /\ Init
  /\ []([Next]_vars)
  /\ WF_vars(Next)
    

=============================================================================
\* Modification History
\* Last modified Fri Sep 20 14:47:28 BST 2019 by leif
\* Created Fri Sep 20 12:02:00 BST 2019 by leif
