------------------------------ MODULE Untitled ------------------------------
VARIABLES status

CONSTANT Starting

vars == << status >>

PossibleValues == { "init", "running", "stopped" }

ASSUME Starting \in PossibleValues

TypeOk == status \in PossibleValues

Init == status = Starting

InitToRunning == status = "init" /\ status' = "running"

RunningToStopped == status = "running" /\ status' = "stopped"

Next == InitToRunning \/ RunningToStopped 

Terminated == <>[](status = "stopped")

Spec == Init /\ []([Next]_vars) /\ WF_vars(Next)

=============================================================================
\* Modification History
\* Last modified Fri Sep 20 14:09:32 BST 2019 by leif
\* Created Fri Sep 20 10:15:34 BST 2019 by leif
