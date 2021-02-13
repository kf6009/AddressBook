---------------------------- MODULE addressbook ----------------------------
CONSTANTS Names, Emails
VARIABLE address

Invariant == address \in SUBSET [name:Names, email:Emails ]

Init == address = {}

Find(name) ==  
     \E a \in address : a.name = name


Add(name,email) == 
    /\ \lnot Find(name)  \* not in address book
    /\ address' = address \union { [name|-> name, email|->email] }

Remove(name) == 
    /\ Find(name)
    /\ address' = address \ {CHOOSE a \in address : a.name = name }

Next == 
    \E n \in Names , e \in Emails : 
        \/ Add(n,e)
        \/ Remove(n)
        \/ Find(n)/\UNCHANGED address

=============================================================================
\* Modification History
\* Last modified Sat Feb 13 11:31:50 GMT 2021 by alunm
\* Created Wed Feb 10 21:49:46 GMT 2021 by alunm
