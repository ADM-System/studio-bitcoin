;Primo esempio di transazioni UTXO
Red []

; questo è il nostro registro dei soldi totali nel sistema 
utxos: [
    [id "tx1" index 0 value 1.0 owner "alice"]
    [id "tx2" index 0 value 0.5 owner "bob" ]
]

print "Sistema inizializzato"

; questa è la funzione per trovare gli utxo
find-utxos: func [owner] [
    result: copy[]
    
    foreach u utxos [
        if u/owner = owner [
            append result u]
    ]
]

;funzione per creare la transazione
make-tx: <MAKE-TX>
if false [make-tx: func [da a amount] [
    inputs: find-utxos da
    total: 0
    used: copy []
    
    foreach i inputs [
        total: total + i/value
        appen used i
        if total >= amount [break]
]
    if total < amount [
         print "fondi insufficienti"
         return none
]    
    
    resto: total - amount
     
    tx: reduce [da da a a amount amount resto resto inputs used
               
               return tx] ]
]
;TEST della transazione --------------------------------------
tx1: make-tx "alice" "charlie" 0.7

print tx1
