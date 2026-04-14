package main

import "fmt"

type VersionMessage struct {
	Version  int
	NodeName string
}

type VerAckMessage struct {
	NodeName string
}

// Nodo A invia la versione
func nodeA() VersionMessage {
	msg := VersionMessage{
		Version:  70015,
		NodeName: "node-A",
	}
	fmt.Println("Node A -> send version")
	fmt.Printf("%+v\n", msg)

	return msg
}

// Nodo B riceve e risponde
func nodeB(received VersionMessage) VerAckMessage {
	fmt.Println("Node B -> recev version from:", received.NodeName)

	ack := VerAckMessage{
		NodeName: "node-b",
	}

	fmt.Println("Node B -> send verack")
	fmt.Printf("%+v\n", ack)

	return ack
}

func main() {

	//  A parla con B
	msg := nodeA()
	ack := nodeB(msg)

	fmt.Println("Node A recev verack from:", ack.NodeName)
	fmt.Println("handshake  completed V")

}
