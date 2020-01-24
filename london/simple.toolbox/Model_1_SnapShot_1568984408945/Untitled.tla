------------------------------ MODULE Untitled ------------------------------
VARIABLES status

CONSTANT Starting

PossibleValues == { "init", "running", "stopped" }

ASSUME Starting \in PossibleValues

TypeOk == status \in PossibleValues

Foo == status = Starting

InitToRunning == status = "init" /\ status' = "running"

RunningToStopped == status = "running" /\ status' = "stopped"

Bar == InitToRunning \/ RunningToStopped

Terminated == <>[](status = "stoppped")

=============================================================================
\* Modification History
\* Last modified Fri Sep 20 13:59:51 BST 2019 by leif
\* Created Fri Sep 20 10:15:34 BST 2019 by leif
