---------------------------- MODULE addressbook ----------------------------
CONSTANTS Names, Emails
VARIABLE address

Invariant == address \in [Names -> Emails ]

Init == address = <<>> \* A different ideom for an empty function...

Add(name,email) == 
    address' = [n \in DOMAIN address \union {name} |->
                         IF n \in DOMAIN address 
                         THEN address[n]
                         ELSE email
               ]

Remove(name) == 
    address' = [ n \in DOMAIN address \ {name} |-> address[n] ]

Find(name) ==  
    /\ name \in DOMAIN address
    /\ UNCHANGED address

Next == 
    \E n \in Names , e \in Emails : 
        \/ Add(n,e)
        \/ Remove(n)
        \/ Find(n)

=============================================================================
\* Modification History
\* Last modified Sat Feb 13 11:11:27 GMT 2021 by alunm
\* Created Wed Feb 10 21:49:46 GMT 2021 by alunm
