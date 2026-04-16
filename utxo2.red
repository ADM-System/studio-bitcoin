Red []

utxos: reduce [
    make object! [id: "tx1" value: 1.0 owner: "alice"]
    make object! [id: "tx2" value: 0.5 owner: "bob"]
]

print "Sistema inizializzato"

find-utxos: func [who] [
    result: copy []
    
    foreach u utxos [
        if u/owner = who [
            append result u
        ]
    ]
    
    return result
]

make-tx: func [from to amount] [
    inputs: find-utxos from
    total: 0.0
    
    foreach i inputs [
        total: total + i/value
    ]
    
    if total < amount [
        print "fondi insufficienti"
        return none
    ]
    
    print "transazione valida!"
    return reduce ["from" from "to" to "amount" amount]
]

tx1: make-tx "alice" "charlie" 0.7
print mold tx1
